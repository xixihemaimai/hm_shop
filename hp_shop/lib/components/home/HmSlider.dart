import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hp_shop/viewmodes/home.dart';

class HmSliderView extends StatefulWidget {
  final List<BannerModel> bannerList;
  HmSliderView({Key? key, required this.bannerList}) : super(key: key);

  @override
  _HmSliderViewState createState() => _HmSliderViewState();
}

class _HmSliderViewState extends State<HmSliderView> {
  int _currentIndex = 0;

  //添加一个搜索框
  Widget _searchBar() {
    return Positioned(
      top: 10,
      left: 30,
      right: 30,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(25),
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            SizedBox(width: 10),
            Text('搜索', style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ),
    );
  }

  //添加的轮播图
  Widget _slider() {
    double width = MediaQuery.of(context).size.width;
    return CarouselSlider.builder(
      itemCount: widget.bannerList.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Image.network(
            widget.bannerList[index].imgUrl ?? '',
            width: width,
            fit: BoxFit.cover,
          ),
        );
      },
      options: CarouselOptions(
        autoPlayAnimationDuration: Duration(milliseconds: 300),
        autoPlay: true,
        height: 300,
        // aspectRatio: 16 / 9,
        viewportFraction: 1.0,
        onPageChanged: (index, reason) {
          _currentIndex = index;
          setState(() {});
        },
      ),
    );
  }

  //添加小圆点
  Widget _dotIndicator() {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.bannerList.length,
          (index) => GestureDetector(
            onTap: () {
              _currentIndex = index;
              setState(() {});
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: _currentIndex == index ? 40 : 20,
              height: 10,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: _currentIndex == index ? Colors.white : Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _slider(),
        //添加一个搜索框
        _searchBar(),
        //添加一个分类
        _dotIndicator(),
      ],
    );
  }
}
