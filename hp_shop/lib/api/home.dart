//获取轮播图数据
import 'package:hp_shop/contants/index.dart';
import 'package:hp_shop/util/DioRequest.dart';
import 'package:hp_shop/viewmodes/home.dart';

//获取轮播图数据
Future<List<BannerModel>> getBannerList() async {
    final response = await dioRequest.getURL(HttpConstants.BANNER_LIST); 
    final ret = (response as List).map((item) => BannerModel.fromJson(item)).toList();
    return ret;
}


//获取分类数据
Future<List<CategoryModel>> getCategoryList() async {
    final response = await dioRequest.getURL(HttpConstants.CATEGORY_LIST); 
    final ret = (response as List).map((item) => CategoryModel.fromJson(item)).toList();
   
    return ret;
}

//获取推荐数据
Future<SpecialOffer> getSpecialOffer() async {
    final response = await dioRequest.getURL(HttpConstants.SPECIAL_RECOMMEND_SECTION); 
    final ret = SpecialOffer.fromJson(response);
     print('分类数据-----------32323--------------: $ret');
    return ret;
}

//获取热款数据
Future<SpecialOffer> getHotProductList() async {
    final response = await dioRequest.getURL(HttpConstants.IN_VOGUE_LIST); 
    final ret =  SpecialOffer.fromJson(response);
    return ret;
}

//获取一站式数据
Future<SpecialOffer> getOneStopProductList() async {
    final response = await dioRequest.getURL(HttpConstants.ONE_STOP_LIST); 
    final ret =  SpecialOffer.fromJson(response);
    return ret;
}

 

 //获取推荐商品数据
 Future<List<RecommendGoods>> getRecommendGoodsList(Map<String,dynamic> params) async {
    final response = await dioRequest.getURL(HttpConstants.RECOMMEND_LIST,params: params); 
    final ret = (response as List).map((item) => RecommendGoods.fromJson(item)).toList();
    return ret;
 }