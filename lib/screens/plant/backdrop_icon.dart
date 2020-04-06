import 'package:flutter/material.dart';

class BackdropIcon extends StatelessWidget {
  final icon;
  final Function onClick;
  final bgColor;

  BackdropIcon({this.icon, this.bgColor, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: 50.0,
        height: 50.0,
        child: Container(
          color: bgColor,
          child: InkWell(
            onTap: () => onClick(),
            splashColor: Colors.black87,
            borderRadius: BorderRadius.circular(12.0),
            child: SizedBox(
              width: 50,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration:
                        BoxDecoration(color: bgColor, shape: BoxShape.circle),
                  ),
                  Center(
                    child: icon,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
