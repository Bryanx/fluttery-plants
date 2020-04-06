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

  Future onClick(MainStore store, BuildContext context) async {
    var plantsCount = store.plantListStore.plants.length;
    await store.plantListStore.add(Plant(nickName: "New plant"));
    store.setCurrentPlantIndex(plantsCount);
    Navigator.of(context).pushNamed("/plant");
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context);
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
