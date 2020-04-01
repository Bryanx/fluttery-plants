import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// Contains the hero animation.
///
class PlantHero extends StatelessWidget {
  const PlantHero({Key key,
    this.tag,
    this.photo,
    this.onTap,
    this.width,
    this.height,
    this.title,
    this.subTitle})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;
  final double height;
  final String tag;
  final String title;
  final String subTitle;

  static const opacityCurve = const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

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
        tag: tag,
        child: CornerRadiusExpansion(
          maxRadius: width,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    photo,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  blackFade(),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.50,
                    padding: const EdgeInsets.only(left: 24.0, bottom: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            title,
                            style: TextStyle(
                              fontFamily: 'AlegreyaSans',
                              fontSize: 36,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          subTitle,
                          style: TextStyle(
                            fontFamily: 'AlegreyaSans',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
