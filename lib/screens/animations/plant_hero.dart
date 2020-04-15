import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/common/dimen_util.dart';
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
  final double width;
  final double height;
  final int index;
  final String title;
  final String subTitle;
  final String imgPath;
  final bool editable;
  final Function(String val) onTitleChanged;
  final Function(String val) onSubTitleChanged;

  const PlantHero(
      {Key key,
      this.index,
      this.width,
      this.title,
      this.subTitle,
      this.imgPath,
      this.editable,
      this.height,
      this.onTitleChanged,
      this.onSubTitleChanged})
      : super(key: key);

  Widget build(BuildContext context) {
    return Hero(
      tag: "plant$index",
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(editable ? DimenUtil.defaultMargin : 25.0),
        decoration: BoxDecoration(
            color: ColorUtil.white,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(editable ? 0 : DimenUtil.defaultRadius),
                bottom: Radius.circular(DimenUtil.defaultRadius))
        ),
        child:
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(DimenUtil.defaultRadius - 4)),
              child: Image.asset(
                  imgPath,
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90)),
          Flexible(
            child: PlantTextHero(
              editableText: editable,
              title: title,
              subTitle: subTitle,
              onTitleChanged: onTitleChanged,
              onSubTitleChanged: onSubTitleChanged,
            ),
          )
        ]),
      ),
    );
  }
}
