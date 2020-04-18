import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttering_plants/screens/home/home_screen.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:fluttering_plants/screens/onboarding/onboarding_screen.dart';
import 'package:fluttering_plants/screens/plant/plant_screen.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';

import 'common/app_theme.dart';
import 'common/warmup_flare.dart';

// all navigation routes
final routes = {
  HomeScreen.route: (BuildContext context) => HomeScreen(),
  PlantScreen.route: (BuildContext context) => PlantScreen(),
  OnboardingScreen.route: (BuildContext context) => OnboardingScreen(),
};

// main entry point of the app
void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
//  debugPaintSizeEnabled = true;
  timeDilation = 1.0;
  Logger.level = Level.verbose; //remove this line for prod.
  warmupFlare().then((_) {
    runApp(Provider<MainStore>(
        create: (_) => MainStore(),
        child: MainApp()));
  });
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context).onboardingStore;
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: store.onboardingFinished ? HomeScreen.route : OnboardingScreen.route,
      routes: routes,
    );
  }
}
