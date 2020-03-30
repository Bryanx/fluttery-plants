import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttering_plants/screens/home/navigationbar.dart';
import 'package:fluttering_plants/screens/home/plant_card.dart';
import 'package:fluttering_plants/screens/home/plant_tabs.dart';
import 'package:fluttering_plants/screens/plant/plant_screen.dart';
import 'package:fluttering_plants/screens/home/plant_list_store.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<PlantListStore>(
      create: (_) => PlantListStore(),
      child: new Scaffold(
        body: Stack(
          children: <Widget>[
            PlantTabs(),
            Align(alignment: Alignment.bottomCenter, child: NavigationBar()),
          ],
        ),
      ),
    );
  }
}

class PlantOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final plantList = Provider.of<PlantListStore>(context);
    plantList.fetch();
    return new Stack(
      children: <Widget>[
        new Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xFFeceff1)),
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
              builder: (_) => ListView.builder(
                  padding: EdgeInsets.all(0.0),
                  scrollDirection: Axis.vertical,
                  itemCount: plantList.plants.length,
                  itemBuilder: (context, index) =>
                      Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlantScreen(
                                      plant: plantList.plants[index],
                                      tag: "overview$index")),
                            );
                          },
                          child: PlantCard(
                              plantList.plants[index], "overview$index")))),
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
