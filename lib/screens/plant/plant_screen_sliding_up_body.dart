import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/common/custom_icons.dart';
import 'package:fluttering_plants/model/plant.dart';
import 'package:fluttering_plants/screens/animations/fade_in_x.dart';
import 'package:fluttering_plants/screens/animations/plant_text_hero.dart';
import 'package:fluttering_plants/screens/common/custom_editable_text.dart';
import 'package:fluttering_plants/screens/common/fancy_fab.dart';
import 'package:fluttering_plants/screens/navigation/drag_direction.dart';
import 'package:fluttering_plants/screens/picture/picture_screen.dart';
import 'package:fluttering_plants/screens/animations/plant_hero.dart';
import 'package:fluttering_plants/screens/plant/plant_screen_sliding_up_panel.dart';
import 'package:fluttering_plants/screens/plant/reminder_card.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:fluttering_plants/stores/plant_store.dart';
import 'package:fluttering_plants/screens/plant/backdrop_icon.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PlantScreenSlidingUpBody extends StatelessWidget {
  final Plant plant;
  final int index;
  PlantScreenSlidingUpBody({this.plant, this.index});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context).plantStore;
    return PlantHero(
      index: index,
      photo: Observer(
          builder: (_) {
            return Image.asset(store.plant.imgPath, fit: BoxFit.cover);
          }
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.6,
    );
  }
}
