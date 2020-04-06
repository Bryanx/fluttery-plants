import 'package:flutter/material.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/screens/animations/plant_text_hero.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:provider/provider.dart';

///
/// Contains the hero animation.
///
/// Allows the hero the remove the cornerradius during transition.
/// The ClipRRect clips the image with corner radius,
/// By making the ClipRRect larger than the height of the sizedbox
/// the cornerradius is removed
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
