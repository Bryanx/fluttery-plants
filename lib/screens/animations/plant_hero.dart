import 'package:flutter/material.dart';
import 'package:fluttering_plants/screens/common/custom_editable_text.dart';

///
/// Contains the hero animation.
///
class PlantHero extends StatelessWidget {
  const PlantHero({Key key,
    this.index,
    this.photo,
    this.onTap,
    this.width,
    this.height,
    this.title,
    this.subTitle,
    this.onTitleChanged,
    this.onSubTitleChanged,
    this.editableText = false})
      : super(key: key);

  final Widget photo;
  final VoidCallback onTap;
  final double width;
  final double height;
  final int index;
  final String title;
  final String subTitle;
  final Function(String val) onTitleChanged;
  final Function(String val) onSubTitleChanged;
  final bool editableText;

  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  Widget blackFade() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.grey.withOpacity(0.0),
                Colors.black54,
              ],
              stops: [
                0.0,
                1.0
              ])),
    );
  }

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Hero(
        createRectTween: _createRectTween,
        tag: "plant$index",
        child: CornerRadiusExpansion(
          maxRadius: width,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Stack(
                children: <Widget>[
                  photo,
                  blackFade(),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.50,
                    padding: const EdgeInsets.only(left: 24.0, bottom: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: getTextWidget(title, onTitleChanged, 36, FontWeight.w700),
                        ),
                        getTextWidget(subTitle, onSubTitleChanged, 20, FontWeight.w500),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getTextWidget(String title, Function(String val) onChanged, double fontSize, FontWeight weight) {
    var textStyle = TextStyle(
      fontFamily: 'AlegreyaSans',
      fontSize: fontSize,
      color: Colors.white,
      fontWeight: weight,
    );
    if (editableText) {
      return new CustomEditableText(
          text: title,
          style: textStyle,
          onChanged: onChanged
      );
    } else {
      return Text(title, style: textStyle);
    }
  }
}

///
/// Allows the hero the remove the cornerradius during transition.
/// The ClipRRect clips the image with corner radius,
/// By making the ClipRRect larger than the height of the sizedbox
/// the cornerradius is removed
///
class CornerRadiusExpansion extends StatelessWidget {
  CornerRadiusExpansion({
    Key key,
    this.maxRadius,
    this.borderRadius = 15.0,
    this.child,
  }) : super(key: key);

  final double maxRadius;
  final double borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: maxRadius,
          height: maxRadius,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}
