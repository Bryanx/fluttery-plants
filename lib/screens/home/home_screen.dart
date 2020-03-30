import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttering_plants/screens/home/navigationbar.dart';
import 'package:fluttering_plants/screens/home/plant_tabs.dart';
import 'package:fluttering_plants/screens/home/plant_list_store.dart';
import 'package:provider/provider.dart';

///
/// Project structure:
/// Home
///   PlantTabs
///     plant_list
///       plant_card
///   BottomNavigationBar
///
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<PlantListStore>(
      create: (_) => PlantListStore(),
      child: new Scaffold(
        body: Stack(
          children: <Widget>[
            PlantTabs(),
            Align(alignment: Alignment.bottomCenter, child: NavigationBar()),
          ],
        ),
      ),
    );
  }
}