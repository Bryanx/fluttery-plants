import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttering_plants/screens/animations/fade_in_up.dart';
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
    final plantListStore = Provider.of<MainStore>(context).plantListStore;
    plantListStore.fetch();
    return Column(
      children: <Widget>[
        new Expanded(
          child: Observer(
            builder: (_) => ListView.builder(
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.vertical,
                itemCount: plantListStore.plants.length,
                itemBuilder: (context, index) =>
                    Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        child: getHero(plantListStore, index, context)
                    )
            ),
          ),
        ),
      ],
    );
  }

  getHero(PlantListStore plantListStore, int index, BuildContext context) {
    return PlantHero(
      tag: "plant$index",
      photo: plantListStore.plants[index].imgPath,
      height: 170.0,
      width: MediaQuery.of(context).size.width,
      title: plantListStore.plants[index].nickName,
      subTitle: plantListStore.plants[index].name,
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => PlantScreen(
                plant: plantListStore.plants[index],
                tag: "plant$index")),
      ),
    );
  }
}