import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hp_shop/components/home/HmCategory.dart';
import 'package:hp_shop/components/home/HmMoreList.dart';
import 'package:hp_shop/components/home/HmSlider.dart';
import 'package:hp_shop/components/home/HmSuggestion.dart';
import 'package:hp_shop/components/home/HmHot.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  //首页的界面
  /**
   *  1.轮播图
   *  2.分类
   *  3.推荐
   *  4.爆款
   *  5.商品列表无线滚动
   * 
  */
  final List<Widget> _slivers = [
    SliverToBoxAdapter(
      child: HmSliderView(),
    ),
    SliverToBoxAdapter(child: SizedBox(height: 10),),
    SliverToBoxAdapter(child: HmCategoryView()),
    SliverToBoxAdapter(child: SizedBox(height: 10),),
    SliverToBoxAdapter(child: HmsuggestionView()),
    SliverToBoxAdapter(child: SizedBox(height: 10),),
    SliverToBoxAdapter(child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Flex(direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: HmHotView()),
        SizedBox(width: 10),
        Expanded(child: HmHotView()),
      ],
    ))
    ),
    SliverToBoxAdapter(child: SizedBox(height: 10),),
    HmMoreListView()
  ];

  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: _slivers
    );
  }
  
  
}



