import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/screens/navigation/page_container.dart';
import 'package:fluttering_plants/screens/navigation/navigationbar.dart';
import 'package:fluttering_plants/screens/navigation/page.dart';
import 'package:fluttering_plants/screens/home/plant_tabs.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:fluttering_plants/stores/plant_list_store.dart';
import 'package:provider/provider.dart';

import 'add_plant_fab.dart';

///
/// The main screen.
///
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          PageContainer(),
          NavigationBar(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: PlantFab(),
    );
  }
}
