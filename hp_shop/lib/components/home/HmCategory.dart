import 'package:flutter/material.dart';
import 'package:hp_shop/viewmodes/home.dart';

class HmCategoryView extends StatefulWidget {
  final List<CategoryModel> categoryList;
  HmCategoryView({Key? key, required this.categoryList}) : super(key: key);

  @override
  _HmcategoryViewState createState() => _HmcategoryViewState();
}

class _HmcategoryViewState extends State<HmCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: List.generate(widget.categoryList.length, (index) {
          return Padding(
            padding: EdgeInsets.only(right: 10),
            child: Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.network(
                    widget.categoryList[index].picture ?? '',
                    width: 25,
                    height: 25,
                  ),
                  Text(
                    widget.categoryList[index].name ?? '',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
