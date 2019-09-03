import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttering_plants/screens/home/home_screen.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

final routes = {
  '/': (BuildContext context) => new HomeScreen(),
};

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black38,
    statusBarBrightness: Brightness.light,
  ));
  timeDilation = 3.0;
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: routes,
  ));
}
