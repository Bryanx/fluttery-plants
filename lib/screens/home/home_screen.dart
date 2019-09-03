import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttering_plants/screens/home/widgets/navigationbar.dart';
import 'package:fluttering_plants/screens/home/widgets/plant_card.dart';
import 'package:fluttering_plants/screens/plant/plant_screen.dart';
import 'package:fluttering_plants/screens/home/store/plant_list.dart';
import 'package:fluttering_plants/utils/utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<PlantList>(
      builder: (_) => PlantList(),
      child: new Scaffold(
        body: PlantOverview(),
      ),
    );
  }
}

class PlantOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final plantList = Provider.of<PlantList>(context);
    plantList.fetch();
    return new Stack(
      children: <Widget>[
        new Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xFFeceff1)
        ),
        Column(children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 110.0, left: 24.0),
            child: Text(
              "Orchid",
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 42,
                color: Color(0xFF21293A),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 10.0, left: 24.0, bottom: 10.0),
            child: Text(
              "Ready for watering",
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 23,
                color: Color(0xFF21293A),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
              height: 165.0,
              child: Observer(
                builder: (_) => ListView(
                  scrollDirection: Axis.horizontal,
                  children: mapIndexed(
                          plantList.plants,
                          (index, plant) => Container(
                              color: Colors.transparent,
                              width: 150.0,
                              margin: EdgeInsets.only(
                                  left: index == 0 ? 20.0 : 5.0,
                                  top: 5.0,
                                  right: index == plantList.plants.length - 1
                                      ? 24.0
                                      : 5.0,
                                  bottom: 5.0),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PlantScreen(plant: plant, tag: "water$index")),
                                    );
                                  },
                                  child: PlantCard(plantList.plants[index], "water$index"))))
                      .toList(),
                ),
              )),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 30.0, left: 24.0, bottom: 10.0),
            child: Text(
              "Overview",
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 23,
                color: Color(0xFF21293A),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Observer(
              builder: (_) => GridView.builder(
                  padding: EdgeInsets.all(0.0),
                  itemCount: plantList.plants.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.only(
                          left: index % 2 == 0 ? 20.0 : 5.0,
                          top: 5.0,
                          right: index % 2 != 0 ? 20.0 : 5.0,
                          bottom: 5.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlantScreen(
                                      plant: plantList.plants[index], tag: "overview$index")),
                            );
                          },
                          child: PlantCard(plantList.plants[index], "overview$index")))),
            ),
          ),
        ]),
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 24.0,
          child: AppBar(
              title: null,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: <Widget>[
                PopupMenuButton<Choice>(
                  onSelected: null,
                  itemBuilder: (BuildContext context) {
                    return choices.skip(2).map((Choice choice) {
                      return PopupMenuItem<Choice>(
                        value: choice,
                        child: Text(choice.title),
                      );
                    }).toList();
                  },
                ),
              ]),
        ),
        Align(alignment: Alignment.bottomCenter, child: NavigationBar()),
      ],
    );
  }
}
