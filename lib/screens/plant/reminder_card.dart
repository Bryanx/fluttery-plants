import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/screens/plant/backdrop_icon.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:provider/provider.dart';

class ReminderCard extends StatelessWidget {
  final String subText;
  final icon;
  final String title;
  final bgColor;
  final subTextColor;
  final titleColor;
  final color;

  ReminderCard({this.icon, this.subText, this.title, this.bgColor, this.color})
      : this.subTextColor = ColorUtil.darken(color, .1),
        this.titleColor = ColorUtil.darken(color, .25);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context).plantStore;
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width * 0.42,
          height: 200.0,
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(24.0))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: BackdropIcon(
                      icon: Icon(icon, color: Colors.white),
                      bgColor: color,
                      onClick: null),
                ),
                Column(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          subText,
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 16,
                            color: subTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Observer(
                          builder: (_) => Text(
                            title == "waterDaysLeft"
                                ? store.waterDaysLeft
                                : store.fertilizeDaysLeft,
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 26,
                              color: titleColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}