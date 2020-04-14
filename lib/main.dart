import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttering_plants/screens/home/home_screen.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:fluttering_plants/screens/plant/plant_screen.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';

import 'common/app_theme.dart';

final routes = {
  '/': (BuildContext context) => HomeScreen(),
  '/plant': (BuildContext context) => PlantScreen(),
};

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
//  debugPaintSizeEnabled = true;
  timeDilation = 1.0;
  Logger.level = Level.verbose; //remove this line for prod.
  runApp(Provider<MainStore>(
      create: (_) => MainStore(),
      child: MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        routes: routes,
      )));
}
