import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
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
import 'package:fluttering_plants/screens/plant/plant_notes.dart';
import 'package:fluttering_plants/screens/plant/reminder_card.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:fluttering_plants/stores/plant_store.dart';
import 'package:fluttering_plants/screens/plant/backdrop_icon.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PlantScreenBody extends StatelessWidget {
  final bgColor = ColorUtil.primaryColor;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context);
    return Container(
      color: bgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 510.0, left: 24, right: 24, bottom: 24),
            child: PlantNotes(
              margin: EdgeInsets.only(top: 24)
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<List<CameraDescription>>(
                future: availableCameras(),
                builder: (context,
                        AsyncSnapshot<List<CameraDescription>>
                            snapshot) =>
                    BackdropIcon(
                        icon: Icon(Icons.photo_camera,
                            color: ColorUtil.white),
                        bgColor: ColorUtil.primaryColor,
                        onClick: () => snapshot.connectionState ==
                                ConnectionState.done
                            ? openCamera(context, snapshot, store.plantStore)
                            : "")),
          ),
        ],
      ),
    );
  }

  openCamera(context, snapshot, PlantStore store) async {
    final imgPath =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TakePictureScreen(camera: snapshot.data.first);
    }));
    var oldFilePath = store.plant.imgPath;
    var plant = store.plant.copyWith(imgPath: imgPath);
    store.updatePlant(plant);
    // delete old file if its not the placeholder
    if (!oldFilePath.contains("sensevieria")) File(oldFilePath).delete();
  }
}
