import 'package:flutter/material.dart';

class BackdropIcon extends StatelessWidget {
  final icon;
  final Function onClick;

  BackdropIcon({this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.transparent,
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onClick(),
        child: icon,
      ),
    );
  }
}
