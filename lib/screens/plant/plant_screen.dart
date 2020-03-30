import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttering_plants/common/custom_icons.dart';
import 'package:fluttering_plants/common/utils.dart';
import 'package:fluttering_plants/model/plant.dart';
import 'package:fluttering_plants/screens/picture/picture_screen.dart';
import 'package:fluttering_plants/screens/plant/plant_store.dart';
import 'package:fluttering_plants/screens/plant/backdrop_icon.dart';
import 'package:provider/provider.dart';

class PlantScreen extends StatelessWidget {
  final Plant plant;
  final tag;

  PlantScreen({this.plant, this.tag});

  @override
  Widget build(BuildContext context) {
    return Provider<PlantStore>(
        create: (_) => PlantStore(),
        child: new Scaffold(
            backgroundColor: Colors.transparent,
            body: PlantDetails(plant, tag)));
  }
}

class PlantDetails extends StatelessWidget {
  final days = List<int>.generate(60, (i) => i += 1);
  final tag;
  final plant;

  PlantDetails(this.plant, this.tag);

  Future onSelectNotification(context) async => await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => this),
      );

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PlantStore>(context);

    store.initState(plant);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: FutureBuilder<List<CameraDescription>>(
                  future: availableCameras(),
                  builder: (context,
                      AsyncSnapshot<List<CameraDescription>> snapshot) =>
                      InkWell(
                        onTap: () {
                          if (snapshot.connectionState == ConnectionState.done) {
                            onOpenCamera(context, snapshot, store);
                          }
                        },
                        child: Hero(
                            tag: tag,
                            child: Observer(
                                builder: (_) =>
                                    Stack(
                                      children: <Widget>[
                                        Container(
                                          width: double.infinity,
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: loadImage(store.plant.imgPath),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.50,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              gradient: LinearGradient(
                                                  begin: FractionalOffset.topCenter,
                                                  end: FractionalOffset.bottomCenter,
                                                  colors: [
                                                    Colors.grey.withOpacity(0.0),
                                                    Colors.black54,
                                                  ],
                                                  stops: [
                                                    0.0,
                                                    1.0
                                                  ])),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.50,
                                          padding: const EdgeInsets.only(left: 24.0, bottom: 24.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 4.0),
                                                child: Text(
                                                  store.plant.nickName,
                                                  style: TextStyle(
                                                    fontFamily: 'AlegreyaSans',
                                                    fontSize: 36,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                store.plant.name,
                                                style: TextStyle(
                                                  fontFamily: 'AlegreyaSans',
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ))),
                      ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0, top: 16.0),
                    child: BackdropIcon(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onClick: () => Navigator.of(context).pop()),
                  ),
                ),
              )
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
                          Column(
                            children: <Widget>[
                              Container(
                                width:
                                MediaQuery.of(context).size.width * 0.42,
                                height: 200.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFFecf0f2),
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
                                            icon: Icon(CustomIcons.drop,
                                                color: Colors.white),
                                            onClick: null),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                "Water",
                                                style: TextStyle(
                                                  fontFamily: 'Open Sans',
                                                  fontSize: 16,
                                                  color: Color(0xFFbbbfc2),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )),
                                          Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Observer(
                                                builder: (_) => Text(
                                                  store.waterDaysLeft,
                                                  style: TextStyle(
                                                    fontFamily: 'Open Sans',
                                                    fontSize: 26,
                                                    color: Color(0xFF21293A),
                                                    fontWeight:
                                                    FontWeight.w700,
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, top: 8.0, right: 16.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Every",
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 18,
                                        color: Color(0xFFbbbfc2),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 4.0),
                                      child: Observer(
                                        builder: (_) => DropdownButton<int>(
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontSize: 18,
                                            color: Color(0xFF21293A),
                                            fontWeight: FontWeight.w700,
                                          ),
                                          value: store.plant.waterInterval,
                                          onChanged: (int newValue) {
                                            var plant = store.plant.copyWith(
                                                waterInterval: newValue);
                                            store.updatePlant(plant);
                                          },
                                          items: days
                                              .map<DropdownMenuItem<int>>(
                                                  (int value) {
                                                return DropdownMenuItem<int>(
                                                  value: value,
                                                  child: Text(value.toString()),
                                                );
                                              }).toList(),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "days.",
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 18,
                                        color: Color(0xFFbbbfc2),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                width:
                                MediaQuery.of(context).size.width * 0.42,
                                height: 200.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFFecf0f2),
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
                                            icon: Icon(CustomIcons.flash,
                                                color: Colors.white),
                                            onClick: null),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                "Fertilizer",
                                                style: TextStyle(
                                                  fontFamily: 'Open Sans',
                                                  fontSize: 16,
                                                  color: Color(0xFFbbbfc2),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )),
                                          Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Observer(
                                                builder: (_) => Text(
                                                  store.fertilizeDaysLeft,
                                                  style: TextStyle(
                                                    fontFamily: 'Open Sans',
                                                    fontSize: 26,
                                                    color: Color(0xFF21293A),
                                                    fontWeight:
                                                    FontWeight.w700,
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, top: 8.0, right: 16.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Every",
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 18,
                                        color: Color(0xFFbbbfc2),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 4.0),
                                      child: Observer(
                                        builder: (_) => DropdownButton<int>(
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontSize: 18,
                                            color: Color(0xFF21293A),
                                            fontWeight: FontWeight.w700,
                                          ),
                                          value:
                                          store.plant.fertilizerInterval,
                                          onChanged: (int newValue) {
                                            var plant = store.plant.copyWith(
                                                fertilizerInterval: newValue);
                                            store.updatePlant(plant);
                                          },
                                          items: days
                                              .map<DropdownMenuItem<int>>(
                                                  (int value) {
                                                return DropdownMenuItem<int>(
                                                  value: value,
                                                  child: Text(value.toString()),
                                                );
                                              }).toList(),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "days.",
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 18,
                                        color: Color(0xFFbbbfc2),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: BackdropIcon(
                          icon: Icon(Icons.alarm, color: Colors.white),
                          onClick: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: BackdropIcon(
                          icon:
                          Icon(Icons.delete_outline, color: Colors.white),
                          onClick: () {
                            store.deletePlant();
                            Navigator.pop(context);
                          }),
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

  onOpenCamera(context, snapshot, PlantStore store) async {
    final imgPath =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TakePictureScreen(camera: snapshot.data.first);
    }));
    var oldFilePath = store.plant.imgPath;
    var plant = store.plant.copyWith(imgPath: imgPath);
    store.updatePlant(plant);
    // delete old file.
    File(oldFilePath).delete();
  }
}
