import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/screens/home/plant_tabs.dart';
import 'package:fluttering_plants/screens/navigation/page.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:provider/provider.dart';

///
/// Main content of the app.
/// When switching pages in the [NavigationBar]
/// the main content is switched here.
/// 
class PageContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final mainStore = Provider.of<MainStore>(context);
    return Container(
      color: ColorUtil.backgroundColor,
      child: Observer(
          builder: (_) {
            switch (mainStore.currentPage) {
              case Page.Plants: return PlantTabs();
              case Page.Watering: return Container(color: Colors.red);
              case Page.Profile: return Container(color: Colors.green);
              case Page.Settings: return Container(color: Colors.yellow);
              default: return PlantTabs();
            }
          }
      ),
    );
  }
}