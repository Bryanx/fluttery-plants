import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/common/dimen_util.dart';
import 'package:fluttering_plants/screens/picture/picture_screen.dart';
import 'package:fluttering_plants/screens/plant/backdrop_icon.dart';
import 'package:fluttering_plants/screens/plant/plant_notes.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:provider/provider.dart';

///
/// The main content of the plant screen.
/// Contains notes.
///
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
            padding: const EdgeInsets.only(top: 580.0, left: DimenUtil.defaultMargin, right: DimenUtil.defaultMargin, bottom: 24),
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
                        onClick: () => snapshot.connectionState ==
                                ConnectionState.done
                            ? openCamera(context, snapshot, store)
                            : "")),
          ),
        ],
      ),
    );
  }

  openCamera(context, snapshot, MainStore store) async {
    final plant = store.plantListStore.plants[store.currentPlantIndex];
    // code of read or write file in external storage (SD card)
    final imgPath = await Navigator.push(
        context, MaterialPageRoute(builder: (context) {
      return TakePictureScreen(camera: snapshot.data.first);
    }));
    var oldFilePath = plant.imgPath;
    store.plantListStore.update(plant..imgPath = imgPath);
    // delete old file if its not the placeholder
    if (!oldFilePath.contains("sensevieria"))
      File(oldFilePath).delete();
  }
}
