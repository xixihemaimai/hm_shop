import 'package:flutter/material.dart';
import 'package:hp_shop/viewmodes/home.dart';

class HmHotView extends StatefulWidget {
  SpecialOffer? hotProduct;
  SpecialOffer? oneStopProduct;
  String type = '';

  HmHotView({Key? key, this.hotProduct, this.oneStopProduct, required this.type}) : super(key: key);

  @override
  _HmhotViewState createState() => _HmhotViewState();
}

class _HmhotViewState extends State<HmHotView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text('爆款'),
    );
  }
}