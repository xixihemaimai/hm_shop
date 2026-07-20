import 'package:flutter/material.dart';

class HmCategoryView extends StatefulWidget {
  HmCategoryView({Key? key}) : super(key: key);

  @override
  _HmcategoryViewState createState() => _HmcategoryViewState();
}

class _HmcategoryViewState extends State<HmCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: List.generate(5, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: 75,
              height: 75,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                '分类$index',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          );
        }),
      ),
    );
  }
}
