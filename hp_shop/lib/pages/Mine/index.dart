import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          //头像和点击按键
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                // color: Colors.blue,
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25), // 圆角大小
                  child: Image.asset(
                    'lib/asset/ic_public_my_active.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                child: Text(
                  '立即登录',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 40,
            width: double.infinity,
            color: Colors.blue,
            child: Row(
              children: [
                Image.asset(
                  'lib/asset/ic_public_my_active.png',
                  fit: BoxFit.cover,
                  width: 30,
                  height: 30,
                ),
                SizedBox(width: 10),
                Text(
                  '用户名',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  color: Colors.yellow,
                  alignment: Alignment.center,
                  child: Text(
                    '立即开通',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),

          Container(
            alignment: Alignment.center,
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/collect');
                    },
                    child: Container(
                      height: 80,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Image.asset(
                            'lib/asset/ic_public_my_active.png',
                            fit: BoxFit.cover,
                            width: 30,
                            height: 30,
                          ),
                          Text(
                            '我的收藏',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/footprint');
                    },
                    child: Container(
                      height: 80,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Image.asset(
                            'lib/asset/ic_public_my_active.png',
                            fit: BoxFit.cover,
                            width: 30,
                            height: 30,
                          ),
                          Text(
                            '我的足迹',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/service');
                    },
                    child: Container(
                      height: 80,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Image.asset(
                            'lib/asset/ic_public_my_active.png',
                            fit: BoxFit.cover,
                            width: 30,
                            height: 30,
                          ),
                          Text(
                            '我的客服',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 100,
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  height: 20,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    '我的订单',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          height: 80,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Image.asset(
                                'lib/asset/ic_public_my_active.png',
                                fit: BoxFit.cover,
                                width: 30,
                                height: 30,
                              ),
                              Text(
                                '全部订单',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/order');
                        },
                        child: Container(
                          height: 80,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Image.asset(
                                'lib/asset/ic_public_my_active.png',
                                fit: BoxFit.cover,
                                width: 30,
                                height: 30,
                              ),
                              Text(
                                '待付款',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/order');
                        },
                        child: Container(
                          height: 80,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Image.asset(
                                'lib/asset/ic_public_my_active.png',
                                fit: BoxFit.cover,
                                width: 30,
                                height: 30,
                              ),
                              Text(
                                '待发货',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/order');
                        },
                        child: Container(
                          height: 80,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Image.asset(
                                'lib/asset/ic_public_my_active.png',
                                fit: BoxFit.cover,
                                width: 30,
                                height: 30,
                              ),
                              Text(
                                '待收货',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/order');
                        },
                        child: Container(
                          height: 80,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Image.asset(
                                'lib/asset/ic_public_my_active.png',
                                fit: BoxFit.cover,
                                width: 30,
                                height: 30,
                              ),
                              Text(
                                '待评价',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
