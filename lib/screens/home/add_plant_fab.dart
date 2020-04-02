import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttering_plants/common/color_util.dart';

///
/// Floating action button to add a plant
///
class AddPlantFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40.0),
      child: new FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Add a new plant',
        highlightElevation: 0.0,
        focusElevation: 0.0,
        hoverElevation: 0.0,
        disabledElevation: 0.0,
        splashColor: ColorUtil.lighten(ColorUtil.primaryColor, .1),
        foregroundColor: Colors.white,
        child: new Icon(Icons.add),
        elevation: 0.0,
      ),
    );
  }
}