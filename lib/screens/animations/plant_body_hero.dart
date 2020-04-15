import 'package:flutter/material.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/screens/animations/plant_text_hero.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:provider/provider.dart';

///
/// Contains a simple hero animation that scales.
///
class PlantBodyHero extends StatelessWidget {
  const PlantBodyHero({Key key, this.width, this.height, this.child, this.tag})
      : super(key: key);

  final Widget child;
  final double width;
  final double height;
  final String tag;

  Widget build(BuildContext context) {
    return Hero(
      tag: "$tag",
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
