import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hp_shop/api/home.dart';
import 'package:hp_shop/components/home/HmCategory.dart';
import 'package:hp_shop/components/home/HmMoreList.dart';
import 'package:hp_shop/components/home/HmSlider.dart';
import 'package:hp_shop/components/home/HmSuggestion.dart';
import 'package:hp_shop/components/home/HmHot.dart';
import 'package:hp_shop/viewmodes/home.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BannerModel> _bannerList = [];
  List<CategoryModel> _categoryList = [];
  SpecialOffer _specialOffer = SpecialOffer(id: '', title: '', subTypes: []);
  SpecialOffer _hotProduct = SpecialOffer(id: '', title: '', subTypes: []);
  SpecialOffer _oneStopProduct = SpecialOffer(id: '', title: '', subTypes: []);
  List<RecommendGoods> _recommendGoodsList = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _paddingTop = 100;
    Future.microtask(() {
      _key.currentState?.show();
    });
    // 监听滚动事件
    addScrollListener();
  }

  //页数
  int _pageNum = 1;
  //是否正在加载更多数据
  bool _isLoading = false;
  //是否还有更多数据
  bool _hasMore = true;
  // 下拉刷新的偏移量
  double _paddingTop = 0;
  //下拉加载更多数据
  void addScrollListener() {
    _scrollController.addListener(() {
      // 滚动到最底部时，加载更多数据
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 50) {
            print('滚动到最底部了');
        _addRecommendGoodsData();
      }
    });
  }

  Future<void> _refresh() async {
    _pageNum = 1;
    _isLoading = false;
    _hasMore = true;
    _recommendGoodsList.clear();
    await _addBannerData();
    await _addCategoryData();
    await _addSpecialOfferData();
    await _addHotProductData();
    await _addOneStopProductData();
    await _addRecommendGoodsData();
    _paddingTop = 0;
    setState(() {});
  }

  //获取轮播图数据
  Future<void> _addBannerData() async {
    final data = await getBannerList();
    _bannerList = data;
    setState(() {});
  }

  //获取分类数据
  Future<void> _addCategoryData() async {
    final data = await getCategoryList();
    _categoryList = data;
  }

  //获取推荐数据
  Future<void> _addSpecialOfferData() async {
    final data = await getSpecialOffer();
    _specialOffer = data;
  }

  //获取热款数据
  Future<void> _addHotProductData() async {
    final data = await getHotProductList();
    _hotProduct = data;
  }

  //获取一站式数据
  Future<void> _addOneStopProductData() async {
    final data = await getOneStopProductList();
    _oneStopProduct = data;
  }

  //获取推荐商品数据
  Future<void> _addRecommendGoodsData() async {
    // 监听滚动事件
    // 滚动到最底部时，加载更多数据
    // 如果正在加载更多数据，或者没有更多数据了，就不加载更多数据
    if (_isLoading || !_hasMore) {
      return;
    }
    int limit = _pageNum * 8;
    _isLoading = true;
    final data = await getRecommendGoodsList({'limit': limit});
    print('推荐商品数据---------------: $data');
    _recommendGoodsList.addAll(data);
    _isLoading = false;
    if (_recommendGoodsList.length < limit) {
      _hasMore = false;
      return;
    }
    _pageNum++;
  }

  //首页的界面
  List<Widget> get _slivers => [
    SliverToBoxAdapter(child: HmSliderView(bannerList: _bannerList)),
    SliverToBoxAdapter(child: SizedBox(height: 10)),
    SliverToBoxAdapter(child: HmCategoryView(categoryList: _categoryList)),
    SliverToBoxAdapter(child: SizedBox(height: 10)),
    SliverToBoxAdapter(child: HmsuggestionView(specialOffer: _specialOffer)),
    SliverToBoxAdapter(child: SizedBox(height: 10)),
    SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: HmHotView(hotProduct: _hotProduct, type: 'hot'),
            ),
            SizedBox(width: 10),
            Expanded(
              child: HmHotView(
                oneStopProduct: _oneStopProduct,
                type: 'oneStop',
              ),
            ),
          ],
        ),
      ),
    ),
    SliverToBoxAdapter(child: SizedBox(height: 10)),
    HmMoreListView(recommendGoodsList: _recommendGoodsList),
  ];

  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _key,
      onRefresh: _refresh,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 0),
        padding: EdgeInsets.only(top: _paddingTop),
        child: 
      CustomScrollView(
        controller: _scrollController,
        slivers: [
          ..._slivers,
          SliverToBoxAdapter(child: Center(
            child: Padding(padding: EdgeInsets.all(20),
            child:_isLoading
                ? const CircularProgressIndicator()
                : Text(_hasMore ? '' : '— 已经到底了 —'),
          )),
          )
        ]
       ),
      )
    );
  }
}
