import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/common/custom_icons.dart';

///
/// Floating action button with menu fab's
///
class FancyFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  FancyFab({this.onPressed, this.tooltip, this.icon});

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab>
    with SingleTickerProviderStateMixin {

  Color openBgColor = ColorUtil.lighten(ColorUtil.primaryColor, .25);
  Color openIconColor = ColorUtil.primaryColor;
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<Color> _buttonIconColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Animation<double> _translateButtonX;
  Animation<double> _fadeTween;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 0.75).animate(_animationController);
    _buttonColor = getColorTween(ColorUtil.primaryColor, ColorUtil.lighten(ColorUtil.solidGrey, .1));
    _buttonIconColor = getColorTween(ColorUtil.white, ColorUtil.darken(ColorUtil.solidGrey, .1));
    _translateButton = getDoubleTween(_fabHeight, -14.0, 0.0, 0.5);
    _translateButtonX = getDoubleTween(0.0, -65.0, 0.5, 0.75);
    _fadeTween = getDoubleTween(0, 1.0, 0.5, 0.75);
    super.initState();
  }

  Animation<double> getFadeTween(double tweenBegin, double tweenEnd,
      double intervalBegin, double intervalEnd) {
    return Tween<double>(
      begin: tweenBegin,
      end: tweenEnd,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        intervalBegin,
        intervalEnd,
        curve: Curves.easeOut,
      ),
    ));
  }

  Animation<double> getDoubleTween(double tweenBegin, double tweenEnd,
      double intervalBegin, double intervalEnd) {
    return Tween<double>(
      begin: tweenBegin,
      end: tweenEnd,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        intervalBegin,
        intervalEnd,
        curve: Curves.easeOut,
      ),
    ));
  }

  Animation<Color> getColorTween(beginColor, endColor) {
    return ColorTween(
      begin: beginColor,
      end: endColor,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget getFabText(String text) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
        decoration: BoxDecoration(
            color: ColorUtil.white,
            borderRadius: BorderRadius.all(
                Radius.circular(24.0))),
        child: Text(text));
  }

  Widget fertilize() {
    return Container(
      child: FloatingActionButton(
        heroTag: null,
        onPressed: null,
        tooltip: 'Fertilize',
        elevation: 0.0,
        backgroundColor: openBgColor,
        foregroundColor: openIconColor,
        child: Icon(CustomIcons.flash),
      ),
    );
  }

  Widget prune() {
    return Container(
      child: FloatingActionButton(
        heroTag: null,
        onPressed: null,
        tooltip: 'Prune',
        elevation: 0.0,
        backgroundColor: openBgColor,
        foregroundColor: openIconColor,
        child: Icon(Icons.content_cut),
      ),
    );
  }

  Widget repot() {
    return Container(
      child: FloatingActionButton(
        heroTag: null,
        onPressed: null,
        tooltip: 'Repot',
        elevation: 0.0,
        focusElevation: 0.0,
        highlightElevation: 0.0,
        hoverElevation: 0.0,
        splashColor: ColorUtil.lighten(openIconColor, .5),
        backgroundColor: openBgColor,
        foregroundColor: openIconColor,
        child: SvgPicture.asset("assets/icons/repot.svg", height: 25, color: ColorUtil.darken(openIconColor,.2)),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        onPressed: animate,
        tooltip: 'Toggle',
        elevation: 0.0,
        backgroundColor: _buttonColor.value,
        foregroundColor: _buttonIconColor.value,
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  getFabTransformText(double y, String text) => Transform(
      transform: Matrix4.translationValues(_translateButtonX.value, y, 0.0),
      child: FadeTransition(
          opacity: _fadeTween,
          child: getFabText(text)),
    );

  getFabTransform(double y, Widget child) => Transform(
      transform: Matrix4.translationValues(0.0, y, 0.0),
      child: child,
    );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        getFabTransformText(_fabHeight * 0.9, "Fertilize"),
        getFabTransformText(_fabHeight * 1.7, "Prune"),
        getFabTransformText(_fabHeight * 2.5, "Repot"),
        getFabTransform(_translateButton.value * 3.0, fertilize()),
        getFabTransform(_translateButton.value * 2.0, prune()),
        getFabTransform(_translateButton.value, repot()),
        toggle(),
      ],
    );
  }
}