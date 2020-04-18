import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/screens/plant/reminder_card.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:provider/provider.dart';

class PlantStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context);
    return Column(
      children: <Widget>[
        ReminderCard(
          icon: SvgPicture.asset("assets/icons/drop.svg",
              height: 60, color: ColorUtil.white),
          title: "Tomorrow",
          subText: "Needs water",
          color: ColorUtil.primaryColor,
        ),
        changeInterval(context, store),
        ReminderCard(
          icon: SvgPicture.asset(
              "assets/icons/thunderbolt.svg",
              height: 60,
              color: ColorUtil.white),
          title: "51 days",
          subText: "Needs fertilizer in",
          margin: EdgeInsets.only(top: 24),
          color: ColorUtil.primaryColor,
        ),
        changeInterval(context, store),
      ],
    );
  }

  changeInterval(context, store) {
    final days = new List<int>.generate(31, (i) => i + 1);
    final hours = new List<String>.generate(24, (i) => "${i+1}:00");
    final textStyle = TextStyle(
      fontFamily: 'AlegreyaSans',
      fontSize: 20,
      color: ColorUtil.white,
      fontWeight: FontWeight.w500,
    );
    final dropDownTextStyle = TextStyle(
      fontFamily: 'AlegreyaSans',
      fontSize: 20,
      color: ColorUtil.white,
      fontWeight: FontWeight.w500,
    );
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Every",
            style: textStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 4.0),
            child: Observer(
              builder: (_) => Theme(
                data: Theme.of(context).copyWith(brightness: Brightness.dark),
                child: DropdownButton<int>(
                  style: textStyle,
                  value: store.plantListStore.plants[store.currentPlantIndex].waterInterval,
                  underline: Container(color: Colors.transparent, height:1.0),
                  onChanged: (int newValue) {
                    var plant = store.plant..waterInterval = newValue;
                    store.updatePlant(plant);
                  },
                  items: days.map<DropdownMenuItem<int>>(
                          (int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString(), style: dropDownTextStyle),
                        );
                      }).toList(),
                ),
              ),
            ),
          ),
          Text(
            "days at",
            style: textStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 4.0),
            child: Observer(
              builder: (_) => Theme(
                data: Theme.of(context).copyWith(brightness: Brightness.dark),
                child: DropdownButton<String>(
                  underline: Container(color: Colors.transparent, height:1.0),
                  style: textStyle,
                  icon: null,
                  value: "11:00",
                  onChanged: (String newValue) {
                    var plant = store.plant..waterInterval = newValue;
                    store.updatePlant(plant);
                  },
                  items: hours.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value.toString(), style: dropDownTextStyle),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Text(
            "hours.",
            style: textStyle,
          ),
        ],
      ),
    );
  }}
