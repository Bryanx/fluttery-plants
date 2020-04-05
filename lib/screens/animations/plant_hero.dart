import 'package:flutter/material.dart';
import 'package:fluttering_plants/screens/common/custom_editable_text.dart';

///
/// Contains the hero animation.
///
/// Allows the hero the remove the cornerradius during transition.
/// The ClipRRect clips the image with corner radius,
/// By making the ClipRRect larger than the height of the sizedbox
/// the cornerradius is removed
///
class PlantHero extends StatelessWidget {
  const PlantHero({Key key,
    this.index,
    this.photo,
    this.width,
    this.height})
      : super(key: key);

  final Widget photo;
  final double width;
  final double height;
  final int index;

  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  Widget build(BuildContext context) {
    return Hero(
      createRectTween: _createRectTween,
      tag: "plant$index",
      child: SizedBox(
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          child: Align(
            alignment: Alignment.topCenter,
            child: ClipRect(
              child: photo,
            ),
          ),
        ),
      ),
    );
  }
}