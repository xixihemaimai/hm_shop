import 'package:flutter/material.dart';

class HmsuggestionView extends StatefulWidget {
  HmsuggestionView({Key? key}) : super(key: key);

  @override
  _HmsuggestionViewState createState() => _HmsuggestionViewState();
}

class _HmsuggestionViewState extends State<HmsuggestionView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 200,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text('建议'),
      ),
    );
  }
}
