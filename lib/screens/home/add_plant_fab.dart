import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/model/plant.dart';
import 'package:fluttering_plants/screens/animations/fade_in_scale.dart';
import 'package:fluttering_plants/screens/plant/plant_screen.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:fluttering_plants/stores/plant_list_store.dart';
import 'package:provider/provider.dart';

///
/// Floating action button to add a plant
///
class PlantFab extends StatelessWidget {

  final plusColor = ColorUtil.white;
  final splashColor = ColorUtil.lighten(ColorUtil.primaryColor, .1);

  Future onClick(PlantListStore store, BuildContext context) async {
    var plantsCount = store.plants.length;
    await store.add(Plant(nickName: "New plant"));
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) =>
              PlantScreen(plant: store.plants[plantsCount], tag: "plant$plantsCount")
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context).plantListStore;
    return FadeInScale(
      child: Container(
        margin: EdgeInsets.only(bottom: 36.0),
        child: new FloatingActionButton(
          onPressed: () => onClick(store, context),
          tooltip: 'Add a new plant',
          highlightElevation: 0.0,
          focusElevation: 0.0,
          hoverElevation: 0.0,
          disabledElevation: 0.0,
          splashColor: splashColor,
          foregroundColor: plusColor,
          child: new Icon(Icons.add),
          elevation: 0.0,
        ),
      ),
    );
  }
}
