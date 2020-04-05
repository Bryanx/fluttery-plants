import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/common/custom_icons.dart';
import 'package:fluttering_plants/model/plant.dart';
import 'package:fluttering_plants/screens/animations/fade_in_up.dart';
import 'package:fluttering_plants/screens/animations/fade_in_x.dart';
import 'package:fluttering_plants/screens/animations/plant_text_hero.dart';
import 'package:fluttering_plants/screens/common/custom_editable_text.dart';
import 'package:fluttering_plants/screens/common/fancy_fab.dart';
import 'package:fluttering_plants/screens/navigation/drag_direction.dart';
import 'package:fluttering_plants/screens/picture/picture_screen.dart';
import 'package:fluttering_plants/screens/animations/plant_hero.dart';
import 'package:fluttering_plants/screens/plant/plant_screen_sliding_up_body.dart';
import 'package:fluttering_plants/screens/plant/plant_screen_sliding_up_panel.dart';
import 'package:fluttering_plants/screens/plant/reminder_card.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:fluttering_plants/stores/plant_store.dart';
import 'package:fluttering_plants/screens/plant/backdrop_icon.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
        child: _PlantScreen(plant, index));
  }
}

class _PlantScreen extends StatelessWidget {
  final days = List<int>.generate(60, (i) => i += 1);
  final index;
  final plant;

  _PlantScreen(this.plant, this.index);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context).plantStore;
    store.initState(plant);
//    _pc.animatePanelToPosition(MediaQuery.of(context).size.height * 0.55);
    return Scaffold(
      backgroundColor: ColorUtil.white,
      floatingActionButton: getFab(),
      body: Stack(
        children: <Widget>[
          PlantScreenSlidingUpBody(plant: plant, index: index),
          FadeInUp(
            delay: 150,
            child: SlidingUpPanel(
              parallaxEnabled: true,
              minHeight: MediaQuery.of(context).size.height * 0.50,
              maxHeight: MediaQuery.of(context).size.height * 0.87,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
              panel: PlantScreenSlidingUpPanel(),
            ),
          ),
          getBackButton(context),
        ],
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
      backgroundColor: ColorUtil.primaryColor,
      foregroundColor: ColorUtil.white,
      label: Text(
        "Add a note",
        style: TextStyle(
          fontFamily: 'AlegreyaSans',
          fontSize: 17,
          color: Colors.white,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
