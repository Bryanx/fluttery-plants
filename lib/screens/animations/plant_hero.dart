import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/screens/animations/plant_text_hero.dart';

///
/// Contains the hero animation.
///
/// Allows the hero the remove the cornerradius during transition.
/// The ClipRRect clips the image with corner radius,
/// By making the ClipRRect larger than the height of the sizedbox
/// the cornerradius is removed
///
class PlantHero extends StatelessWidget {
  const PlantHero(
      {Key key,
      this.index,
      this.width,
      this.title,
      this.subTitle,
      this.imgPath,
      this.editableText,
      this.height})
      : super(key: key);

  final double width;
  final double height;
  final int index;
  final String title;
  final String subTitle;
  final String imgPath;
  final bool editableText;

  Widget build(BuildContext context) {
    return Hero(
      tag: "plant$index",
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
            color: ColorUtil.white,
            borderRadius: BorderRadius.all(Radius.circular(24.0))),
        child:
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(24.0)),
              child: Image.asset(imgPath,
                  fit: BoxFit.cover, width: 90, height: 90)),
          PlantTextHero(editableText: false, title: title, subTitle: subTitle)
        ]),
      ),
    );
  }
}
