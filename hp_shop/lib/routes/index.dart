import 'package:flutter/material.dart';
import 'package:hp_shop/pages/Login/index.dart';
import 'package:hp_shop/pages/Main/Main.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => MainPage(),
  '/login': (context) => LoginPage(),
};