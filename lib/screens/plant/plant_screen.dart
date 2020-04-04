import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/common/custom_icons.dart';
import 'package:fluttering_plants/common/utils.dart';
import 'package:fluttering_plants/model/plant.dart';
import 'package:fluttering_plants/screens/animations/fade_in_left_.dart';
import 'package:fluttering_plants/screens/animations/fade_in_right.dart';
import 'package:fluttering_plants/screens/home/plant_list.dart';
import 'package:fluttering_plants/screens/picture/picture_screen.dart';
import 'package:fluttering_plants/screens/animations/plant_hero.dart';
import 'package:fluttering_plants/screens/plant/reminder_card.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:fluttering_plants/stores/plant_store.dart';
import 'package:fluttering_plants/screens/plant/backdrop_icon.dart';
import 'package:provider/provider.dart';

///
/// Single plant screen
///
class PlantScreen extends StatelessWidget {
  final Plant plant;
  final index;

  PlantScreen({this.plant, this.index});

  @override
  Widget build(BuildContext context) {
    return Provider<MainStore>(
        create: (_) => MainStore(),
        child: new Scaffold(
            backgroundColor: Colors.transparent,
            body: _PlantScreen(plant, index)));
  }
}

class _PlantScreen extends StatelessWidget {
  final days = List<int>.generate(60, (i) => i += 1);
  final index;
  final plant;

  _PlantScreen(this.plant, this.index);

  Future onSelectNotification(context) async => await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => this),
      );

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context).plantStore;

    store.initState(plant);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              getHero(context, store),
              getBackButton(context)
            ],
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ReminderCard(
                              icon: CustomIcons.drop,
                              subText: "Water",
                              title: "waterDaysLeft"),
                          ReminderCard(
                              icon: CustomIcons.flash,
                              subText: "Fertilizer",
                              title: "fertilizerDaysLeft"),
                        ],
                      ),
                    ),
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
          ),
        ],
      ),
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

  getBackButton(BuildContext context) {
    return FadeInLeft(
      child: Align(
        alignment: Alignment.topLeft,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 16.0),
            child: BackdropIcon(
                icon: Icon(Icons.arrow_back, color: ColorUtil.primaryColor),
                bgColor: ColorUtil.white,
                onClick: () => Navigator.of(context).pop()),
          ),
        ),
      ),
    );
  }

  getHero(BuildContext context, PlantStore store) {
    return Align(
      alignment: Alignment.topCenter,
      child: PlantHero(
        index: index,
        photo: Observer(
          builder: (_) {
            return Image.asset(
              store.plant.imgPath,
              width: double.infinity,
              fit: BoxFit.cover,
            );
          }
        ),
        title: plant.nickName,
        subTitle: plant.name,
        editableText: true,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.50,
        onTitleChanged: (value) {
          plant.nickName = value;
          store.updatePlant(plant);
        },
        onSubTitleChanged: (value) {
          plant.name = value;
          store.updatePlant(plant);
        },
      ),
    );
  }
}
