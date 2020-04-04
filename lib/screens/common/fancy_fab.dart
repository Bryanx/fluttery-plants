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
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: ColorUtil.primaryColor,
      end: ColorUtil.lighten(ColorUtil.solidGrey, .1),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _buttonIconColor = ColorTween(
      begin: ColorUtil.white,
      end: ColorUtil.darken(ColorUtil.solidGrey, .1),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: Curves.easeOut,
      ),
    ));
    _translateButtonX = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: Curves.easeOut,
      ),
    ));
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 3.0,
            0.0,
          ),
          child: fertilize(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: prune(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: repot(),
        ),
        toggle(),
      ],
    );
  }
}