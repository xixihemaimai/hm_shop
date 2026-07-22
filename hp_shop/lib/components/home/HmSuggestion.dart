import 'package:flutter/material.dart';
import 'package:hp_shop/viewmodes/home.dart';

class HmsuggestionView extends StatefulWidget {
  final SpecialOffer specialOffer;
  HmsuggestionView({Key? key, required this.specialOffer}) : super(key: key);

  @override
  _HmsuggestionViewState createState() => _HmsuggestionViewState();
}

class _HmsuggestionViewState extends State<HmsuggestionView> {
  //添加顶部标题
  Widget addTopTitle() {
    return Row(
      children: [
        SizedBox(width: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'lib/asset/home_cmd_title.png',
            fit: BoxFit.cover,
            width: 300,
            height: 40,
          ),
        ),
      ],
    );
  }

  //添加一张图片
  Widget addImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        'lib/asset/home_cmd_inner.png',
        fit: BoxFit.cover,
        width: 100,
        height: 150,
      ),
    );
  }

  //添加商品列表
  Widget addProductList(){
    return Row(
      children: List.generate(widget.specialOffer.subTypes.length, (index){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'lib/asset/home_cmd_inner.png',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 150,
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(widget.specialOffer.subTypes[index].title,style: TextStyle(fontSize: 12,color: Colors.white),),
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          addTopTitle(),
          SizedBox(height: 10),
          Row(
            children: [
              addImage(),
              SizedBox(width: 10),
              Expanded(child:  //添加商品列表
                addProductList()),
            ],
          ),
        ],
      ),
    );
  }
}
