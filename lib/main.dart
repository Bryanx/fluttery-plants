import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttering_plants/screens/home/home_screen.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import 'common/app_theme.dart';

final routes = {
  '/': (BuildContext context) => new HomeScreen(),
};

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
//  debugPaintSizeEnabled = true;
  timeDilation = 1.0;
  runApp(new MaterialApp(
    theme: appTheme,
    debugShowCheckedModeBanner: false,
    routes: routes,
  ));
}
