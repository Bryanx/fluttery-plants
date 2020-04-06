import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/screens/animations/fade_in_x.dart';
import 'package:fluttering_plants/screens/animations/plant_body_hero.dart';
import 'package:fluttering_plants/screens/animations/plant_hero.dart';
import 'package:fluttering_plants/screens/navigation/drag_direction.dart';
import 'package:fluttering_plants/screens/plant/backdrop_icon.dart';
import 'package:fluttering_plants/screens/plant/plant_screen_body.dart';
import 'package:fluttering_plants/screens/plant/reminder_card.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:provider/provider.dart';

///
/// Single plant screen
///

class PlantScreen extends StatelessWidget {
  final days = List<int>.generate(60, (i) => i += 1);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context);
    developer.log("Plants: ${store.plantListStore.plants.length}");
    final plant = store.plantListStore.plants[store.currentPlantIndex];
    return Scaffold(
      backgroundColor: ColorUtil.white,
      floatingActionButton: getFab(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Stack(
            children: <Widget>[
              Align(
                child: Hero(
                  tag: "body${store.currentPlantIndex}",
                  child: PlantScreenBody(),
                ),
              ),
              PlantBodyHero(
                tag: "stats${store.currentPlantIndex}",
                child: Container(
                  height: 510,
                  padding: EdgeInsets.only(top: 220.0 + 24.0, right: 24, left: 24, bottom: 36),
                  decoration: BoxDecoration(
                      color: ColorUtil.black.withOpacity(.1),
                      borderRadius: BorderRadius.all(Radius.circular(24.0))),
                  child: Column(
                    children: <Widget>[
                      ReminderCard(
                        icon: SvgPicture.asset("assets/icons/drop.svg", height: 60, color: ColorUtil.white),
                        title: "Tomorrow",
                        subText: "Needs water",
                        color: ColorUtil.primaryColor,
                      ),
                      ReminderCard(
                        icon: SvgPicture.asset("assets/icons/thunderbolt.svg", height: 60, color: ColorUtil.white),
                        title: "51 days",
                        subText: "Needs fertilizer in",
                        margin: EdgeInsets.only(top: 24),
                        color: ColorUtil.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              PlantHero(
                index: store.currentPlantIndex,
                width: MediaQuery.of(context).size.width,
                height: 220,
                title: plant.nickName,
                subTitle: plant.name,
                imgPath: plant.imgPath,
                editableText: true,
              ),
              getBackButton(context),
            ],
          ),
        ),
      ),
    );
  }

  getBackButton(BuildContext context) {
    return FadeInX(
      direction: Direction.LEFT,
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

  getFab() {
    return FloatingActionButton.extended(
      onPressed: () => {},
      tooltip: 'Submit a new note for this plant.',
      elevation: 0.0,
      backgroundColor: ColorUtil.white,
      foregroundColor: ColorUtil.primaryColor,
      label: Text(
        "Add a note",
        style: TextStyle(
          fontFamily: 'AlegreyaSans',
          fontSize: 17,
          color: ColorUtil.primaryColor,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
