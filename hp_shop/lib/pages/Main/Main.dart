import 'package:flutter/material.dart';
import 'package:hp_shop/pages/Cart/index.dart';
import 'package:hp_shop/pages/Category/index.dart';
import 'package:hp_shop/pages/Home/index.dart';
import 'package:hp_shop/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, dynamic>> _bottomNavigationBarItems = [
    {
      'icon': 'lib/asset/ic_public_home_normal.png',
      'activeIcon': 'lib/asset/ic_public_home_active.png',
      'label': '首页',
    },
    {
      'icon': 'lib/asset/ic_public_pro_normal.png',
      'activeIcon': 'lib/asset/ic_public_pro_active.png',
      'label': '分类',
    },
    {
      'icon': 'lib/asset/ic_public_cart_normal.png',
      'activeIcon': 'lib/asset/ic_public_cart_active.png',
      'label': '购物车',
    },
    {
      'icon': 'lib/asset/ic_public_my_normal.png',
      'activeIcon': 'lib/asset/ic_public_my_active.png',
      'label': '我的',
    },
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            HomePage(),
            CategoryPage(),
            CartPage(),
            MinePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        items: List.generate(_bottomNavigationBarItems.length, (index) {
          return BottomNavigationBarItem(
            icon: Image.asset(
              _bottomNavigationBarItems[index]['icon'],
              width: 20,
              height: 20,
            ),
            activeIcon: Image.asset(
              _bottomNavigationBarItems[index]['activeIcon'],
              width: 20,
              height: 20,
            ),
            label: _bottomNavigationBarItems[index]['label'],
          );
        }),
      ),
    );
  }
}
