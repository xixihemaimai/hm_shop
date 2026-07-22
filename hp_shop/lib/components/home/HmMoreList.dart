import 'package:flutter/material.dart';
import 'package:hp_shop/viewmodes/home.dart';

class HmMoreListView extends StatefulWidget {
  final List<RecommendGoods> recommendGoodsList;
  HmMoreListView({Key? key, required this.recommendGoodsList}) : super(key: key);

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
       childAspectRatio: 0.7,
      children: List.generate(widget.recommendGoodsList.length, (index){
        return Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(widget.recommendGoodsList[index].picture ?? '',
                errorBuilder: (context, error, stackTrace) => Container(
                  child: Image.asset('lib/asset/home_cmd_inner.png'),
                ),
                fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 5),
              Text(widget.recommendGoodsList[index].name ?? '',textAlign: TextAlign.left,),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const SizedBox(width: 5),
                 Text(' ¥${widget.recommendGoodsList[index].price.toString()}'),
                 const Spacer(), 
                 Text('   ${widget.recommendGoodsList[index].payCount.toString()}人付款',textAlign: TextAlign.right,),
                  const SizedBox(width: 5),   
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}