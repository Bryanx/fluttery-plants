import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/screens/animations/fade_in_x.dart';
import 'package:fluttering_plants/screens/animations/fade_in_up.dart';
import 'package:fluttering_plants/screens/animations/plant_text_hero.dart';
import 'package:fluttering_plants/screens/home/plant_card.dart';
import 'package:fluttering_plants/screens/plant/backdrop_icon.dart';
import 'package:fluttering_plants/screens/animations/plant_hero.dart';
import 'package:fluttering_plants/screens/plant/plant_screen.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:fluttering_plants/stores/plant_list_store.dart';
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
                      onTap: () =>
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PlantScreen(
                                          plant: plantListStore.plants[index],
                                          index: index))),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 190.0,
                            padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 15.0),
                            decoration: BoxDecoration(
                                color: ColorUtil.primaryColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(24.0))),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("Needs water tomorrow.",
                                  style: TextStyle(
                                    fontFamily: 'AlegreyaSans',
                                    fontSize: 20,
                                    color: ColorUtil.white,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(25.0),
                            decoration: BoxDecoration(
                                color: ColorUtil.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(24.0))),
                            child: Row(children: <Widget>[
                              getHero(plantListStore, index, context),
                              Column(
                                children: <Widget>[
                                  getTextHero(plantListStore, index, context)
                                ],
                              )
                            ]),
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

  getTextHero(PlantListStore plantListStore, int index, BuildContext context) {
    var plant = plantListStore.plants[index];
    return PlantTextHero(
        editableText: false, title: plant.nickName, subTitle: plant.name);
  }

  getHero(PlantListStore plantListStore, int index, BuildContext context) {
    var plant = plantListStore.plants[index];
    return PlantHero(
      photo: Image.asset(plant.imgPath, fit: BoxFit.cover),
      height: 90,
      width: 90,
      index: index,
    );
  }
}
