import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/screens/animations/fade_in_x.dart';
import 'package:fluttering_plants/screens/animations/plant_body_hero.dart';
import 'package:fluttering_plants/screens/animations/plant_hero.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:provider/provider.dart';

///
/// A vertical list of plant cards.
///
class PlantList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context);
    final plantListStore = store.plantListStore;
    plantListStore.fetch();
    return Column(
      children: <Widget>[
        new Expanded(
          child: Observer(
            builder: (_) => ListView.builder(
              padding: EdgeInsets.all(0.0),
              scrollDirection: Axis.vertical,
              itemCount: plantListStore.plants.length,
              itemBuilder: (context, index) => FadeInX(
                  direction: store.tabDragDirection,
                  delay: 0.33 * index,
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    child: InkWell(
                      onTap: () {
                        store.setCurrentPlantIndex(index);
                        return Navigator.of(context).pushNamed("/plant");
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 100),
                            child: PlantBodyHero(
                              width: MediaQuery.of(context).size.width,
                              height: 50.0,
                              tag: "body$index",
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50.0,
                                padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 15.0),
                                decoration: BoxDecoration(
                                    color: ColorUtil.primaryColor,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(24.0))),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 100),
                            child: PlantBodyHero(
                              width: MediaQuery.of(context).size.width,
                              height: 45.0,
                              tag: "stats$index",
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 45.0,
                                padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 15.0),
                                decoration: BoxDecoration(
                                    color: ColorUtil.black.withOpacity(.1),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(24.0))),
                              ),
                            ),
                          ),
                          PlantHero(
                            index: index,
                            width: MediaQuery.of(context).size.width,
                            height: 140,
                            title: plantListStore.plants[index].nickName,
                            subTitle: plantListStore.plants[index].name,
                            imgPath: plantListStore.plants[index].imgPath,
                            editableText: false,
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
        )
      ],
    );
  }
}
