import 'package:flutter/material.dart';

class HmHotView extends StatefulWidget {
  HmHotView({Key? key}) : super(key: key);

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