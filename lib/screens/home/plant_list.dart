import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttering_plants/screens/home/plant_card.dart';
import 'package:fluttering_plants/screens/plant/backdrop_icon.dart';
import 'package:fluttering_plants/screens/plant/plant_hero.dart';
import 'package:fluttering_plants/screens/plant/plant_screen.dart';
import 'package:fluttering_plants/screens/home/plant_list_store.dart';
import 'package:provider/provider.dart';

///
/// A vertical list of plant cards.
///
class PlantList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final plantList = Provider.of<PlantListStore>(context);
    plantList.fetch();
    return Column(
      children: <Widget>[
        new Expanded(
          child: Observer(
            builder: (_) => ListView.builder(
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.vertical,
                itemCount: plantList.plants.length,
                itemBuilder: (context, index) => Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    child: PlantHero(
                      tag: "plant$index",
                      photo: plantList.plants[index].imgPath,
                      height: 170.0,
                      width: MediaQuery.of(context).size.width,
                      title: plantList.plants[index].nickName,
                      subTitle: plantList.plants[index].name,
                      onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => PlantScreen(
                                    plant: plantList.plants[index],
                                    tag: "plant$index")),
                          ),
                    )
                )
            ),
          ),
        ),
      ],
    );
  }
}