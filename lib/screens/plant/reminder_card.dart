import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/common/dimen_util.dart';
import 'package:fluttering_plants/model/days.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:provider/provider.dart';

///
/// Small card with a reminder and an icon.
///
class ReminderCard extends StatelessWidget {
  final String subText;
  final icon;
  final String title;
  final bgColor = ColorUtil.white.withOpacity(0.15);
  final subTextColor = ColorUtil.white;
  final titleColor = ColorUtil.white;
  final color;
  final margin;

  ReminderCard({this.icon, this.subText, this.title, this.color, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(Radius.circular(DimenUtil.defaultRadius - 4))),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  child: icon,
                padding: EdgeInsets.only(right: 8),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      subText,
                      style: TextStyle(
                        fontFamily: 'AlegreyaSans',
                        fontSize: 20,
                        color: subTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'AlegreyaSans',
                        fontSize: 40,
                        height: 0.95,
                        color: titleColor,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ])
            ],
          ),
        ],
      ),
    );
  }
}


