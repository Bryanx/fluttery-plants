import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/common/custom_icons.dart';
import 'package:fluttering_plants/model/plant.dart';
import 'package:fluttering_plants/screens/animations/fade_in_up.dart';
import 'package:fluttering_plants/screens/animations/fade_in_x.dart';
import 'package:fluttering_plants/screens/animations/plant_text_hero.dart';
import 'package:fluttering_plants/screens/common/custom_editable_text.dart';
import 'package:fluttering_plants/screens/common/fancy_fab.dart';
import 'package:fluttering_plants/screens/navigation/drag_direction.dart';
import 'package:fluttering_plants/screens/picture/picture_screen.dart';
import 'package:fluttering_plants/screens/animations/plant_hero.dart';
import 'package:fluttering_plants/screens/plant/reminder_card.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:fluttering_plants/stores/plant_store.dart';
import 'package:fluttering_plants/screens/plant/backdrop_icon.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


class PlantScreenSlidingUpPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context).plantStore;
    return Column(
      children: <Widget>[
        Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                getEditableText(context, store.plant.nickName, 40, ColorUtil.headerColor, (value) {
                  store.updatePlant(store.plant.copyWith(nickName: value));
                }),
                getEditableText(context, store.plant.name, 20,
                    ColorUtil.lighten(ColorUtil.headerColor, .25),
                        (value) {
                      store.updatePlant(store.plant.copyWith(name: value));
                    }),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: BackdropIcon(
                          icon: Icon(Icons.delete_outline, color: ColorUtil.white),
                          bgColor: ColorUtil.primaryColor,
                          onClick: () {
                            store.deletePlant();
                            Navigator.pop(context);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FutureBuilder<List<CameraDescription>>(
                          future: availableCameras(),
                          builder: (context,
                              AsyncSnapshot<
                                  List<CameraDescription>> snapshot) =>
                              BackdropIcon(
                                  icon: Icon(Icons.photo_camera,
                                      color: ColorUtil.white),
                                  bgColor: ColorUtil.primaryColor,
                                  onClick: () =>
                                  snapshot.connectionState ==
                                      ConnectionState.done ? openCamera(
                                      context, snapshot, store) : ""
                              )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  getEditableText(BuildContext context, String text, double fontSize, Color color, onChanged) {
    return new CustomEditableText(
        text: text,
        style: TextStyle(
          fontFamily: 'AlegreyaSans',
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.w500,
        ),
        onChanged: (value) => onChanged(value)
    );
  }

  openCamera(context, snapshot, PlantStore store) async {
    final imgPath = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TakePictureScreen(camera: snapshot.data.first);
    }));
    var oldFilePath = store.plant.imgPath;
    var plant = store.plant.copyWith(imgPath: imgPath);
    store.updatePlant(plant);
    // delete old file if its not the placeholder
    if (!oldFilePath.contains("sensevieria"))
      File(oldFilePath).delete();
  }
}
