
import 'package:flutter/material.dart';
import 'package:fluttering_plants/common/color_util.dart';


class BackdropIcon extends StatelessWidget {
  final icon;
  final Function onClick;
  final bgColor = ColorUtil.primaryColor;

  BackdropIcon({this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.0,
      height: 50.0,
      child: Container(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onClick(),
          splashColor: Colors.black87,
          borderRadius: BorderRadius.circular(12.0),
          child: SizedBox(
            width: 50,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.all(Radius.circular(12.0))
                  ),
                ),
                Center(
                  child: icon,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}