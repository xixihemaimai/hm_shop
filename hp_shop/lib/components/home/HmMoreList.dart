import 'package:flutter/material.dart';

class HmMoreListView extends StatefulWidget {
  HmMoreListView({Key? key}) : super(key: key);

  @override
  _HmMoreListViewState createState() => _HmMoreListViewState();
}

class _HmMoreListViewState extends State<HmMoreListView> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: List.generate(10, (index){
        return Container(
          height: 140,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text('商品$index'),
        );
      }),
    );
  }
}