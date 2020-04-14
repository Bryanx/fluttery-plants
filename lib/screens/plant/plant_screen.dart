import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/common/dimen_util.dart';
import 'package:fluttering_plants/model/plant.dart';
import 'package:fluttering_plants/screens/animations/fade_in_x.dart';
import 'package:fluttering_plants/screens/animations/plant_body_hero.dart';
import 'package:fluttering_plants/screens/animations/plant_hero.dart';
import 'package:fluttering_plants/screens/navigation/drag_direction.dart';
import 'package:fluttering_plants/screens/plant/backdrop_icon.dart';
import 'package:fluttering_plants/screens/plant/plant_screen_body.dart';
import 'package:fluttering_plants/screens/plant/reminder_card.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:fluttering_plants/stores/plant_list_store.dart';
import 'package:provider/provider.dart';

///
/// Single plant screen
///

class PlantScreen extends StatelessWidget {
  final days = List<int>.generate(60, (i) => i += 1);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context);
    var plantStore = store.plantListStore;
    final plant = plantStore.plants[store.currentPlantIndex];
    return Scaffold(
      backgroundColor: ColorUtil.white,
      floatingActionButton: getFab(),
      appBar: AppBar(
        leading: getBackButton(context),
        backgroundColor: ColorUtil.white,
        elevation: 0.0,
        actions: <Widget>[
          getMenu(plantStore, plant, context),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Stack(
                children: <Widget>[
                  Hero(
                    tag: "body${store.currentPlantIndex}",
                    child: PlantScreenBody(),
                  ),
                  PlantBodyHero(
                    tag: "stats${store.currentPlantIndex}",
                    child: Container(
                      height: 460,
                      padding: EdgeInsets.only(
                          top: 170.0 + 24.0,
                          right: DimenUtil.defaultMargin,
                          left: DimenUtil.defaultMargin,
                          bottom: 36),
                      decoration: BoxDecoration(
                          color: ColorUtil.black.withOpacity(.1),
                          borderRadius: BorderRadius.all(
                              Radius.circular(DimenUtil.defaultRadius))),
                      child: Column(
                        children: <Widget>[
                          ReminderCard(
                            icon: SvgPicture.asset("assets/icons/drop.svg",
                                height: 60, color: ColorUtil.white),
                            title: "Tomorrow",
                            subText: "Needs water",
                            color: ColorUtil.primaryColor,
                          ),
                          ReminderCard(
                            icon: SvgPicture.asset(
                                "assets/icons/thunderbolt.svg",
                                height: 60,
                                color: ColorUtil.white),
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
                    height: 170,
                    title: plant.nickName,
                    subTitle: plant.name,
                    imgPath: plant.imgPath,
                    editable: true,
                    onTitleChanged: (val) {
                      plantStore.update(plant.copyWith(nickName: val));
                    },
                    onSubTitleChanged: (val) {
                      plantStore.update(plant.copyWith(name: val));
                    },
                  ),
                ],
              ),
            ),
          ],
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

  getBackButton(BuildContext context) {
    return FadeInX(
      direction: Direction.LEFT,
      child: Padding(
        padding: const EdgeInsets.only(left: DimenUtil.defaultMargin),
        child: BackdropIcon(
            icon: RotatedBox(
              quarterTurns: 2,
              child: SvgPicture.asset("assets/icons/arrow.svg",
                  height: 22, color: ColorUtil.primaryColor),
            ),
            onClick: () => Navigator.of(context).pop()),
      ),
    );
  }

  Widget getMenu(PlantListStore plantStore, Plant plant, BuildContext context) {
    var textStyle = TextStyle(
      fontFamily: 'AlegreyaSans',
      fontSize: 20,
      color: ColorUtil.headerColor,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
    );
    return FadeInX(
      direction: Direction.RIGHT,
      child: Padding(
        padding: const EdgeInsets.only(right: DimenUtil.defaultMargin - 15),
        child: PopupMenuButton<int>(
          onSelected: (result) {
            switch (result) {
              case 1: break;
              case 2: {
                plantStore.delete(plant);
                Navigator.of(context).pop();
              } break;
            }
          },
          icon: SvgPicture.asset("assets/icons/menu2.svg",
              height: 10, color: ColorUtil.primaryColor),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: Text("Move to cemetery", style: textStyle),
            ),
            PopupMenuItem(
              value: 2,
              child: Text("Delete this plant", style: textStyle),
            ),
          ],
        ),
      ),
    );
  }
}
