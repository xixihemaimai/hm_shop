//轮播图数据
class BannerModel {
  String? id;
  String? imgUrl;
  String? hrefUrl;
  String? type;

  BannerModel({this.id, this.imgUrl, this.hrefUrl, this.type});

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json['id'],
    imgUrl: json['imgUrl'],
    hrefUrl: json['hrefUrl'],
    type: json['type'],
  );
}

// 分类
class CategoryModel {
  String id;
  String name;
  String picture;

  CategoryModel({required this.id, required this.name, required this.picture});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json['id'],
    name: json['name'],
    picture: json['picture'],
  );
}

//建议

/// goods_item.dart
class GoodsItem {
  final String id;
  final String name;
  final String? desc;
  final String price;
  final String picture;
  final int orderNum;

  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory GoodsItem.fromJson(Map<String, dynamic> json) {
    return GoodsItem(
      id: json['id'] as String,
      name: json['name'] as String,
      desc: json['desc'] as String?,
      price: json['price'] as String,
      picture: json['picture'] as String,
      orderNum: json['orderNum'] as int,
    );
  }
}


class GoodsPage {
  final int counts;
  final int pageSize;
  final int pages;
  final int page;
  final List<GoodsItem> items;

  GoodsPage({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodsPage.fromJson(Map<String, dynamic> json) {
    return GoodsPage(
      counts: json['counts'] as int,
      pageSize: json['pageSize'] as int,
      pages: json['pages'] as int,
      page: json['page'] as int,
      items: (json['items'] as List)
          .map((e) => GoodsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}


/// sub_type.dart
class SubType {
  final String id;
  final String title;
  final GoodsPage goodsItems;

  SubType({
    required this.id,
    required this.title,
    required this.goodsItems,
  });

  factory SubType.fromJson(Map<String, dynamic> json) {
    return SubType(
      id: json['id'] as String,
      title: json['title'] as String,
      goodsItems: GoodsPage.fromJson(json['goodsItems'] as Map<String, dynamic>),
    );
  }
}

/// special_offer.dart
class SpecialOffer {
  final String id;
  final String title;
  final List<SubType> subTypes;

  SpecialOffer({
    required this.id,
    required this.title,
    required this.subTypes,
  });

  factory SpecialOffer.fromJson(Map<String, dynamic> json) {
    return SpecialOffer(
      id: json['id'] as String,
      title: json['title'] as String,
      subTypes: (json['subTypes'] as List)
          .map((e) => SubType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}








//商品
/// recommend_goods.dart
class RecommendGoods {
  final String id;
  final String name;
  final double price;
  final String picture;
  final int payCount;

  RecommendGoods({
    required this.id,
    required this.name,
    required this.price,
    required this.picture,
    required this.payCount,
  });

  factory RecommendGoods.fromJson(Map<String, dynamic> json) {
    return RecommendGoods(
      id: json['id'] as String,
      name: json['name'] as String,
      // price 在 JSON 里是数字，用 num 兼容 int/double
      price: (json['price'] as num).toDouble(),
      picture: json['picture'] as String,
      payCount: json['payCount'] as int,
    );
  }
}