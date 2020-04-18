import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttering_plants/common/app_theme.dart';
import 'package:fluttering_plants/common/color_util.dart';
import 'package:fluttering_plants/common/custom_icons.dart';
import 'package:fluttering_plants/model/plant.dart';
import 'package:fluttering_plants/screens/animations/fade_in_up.dart';
import 'package:fluttering_plants/screens/navigation/page.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:fluttering_plants/stores/plant_list_store.dart';
import 'package:provider/provider.dart';

///
/// The bottom navigationbar of the app.
///
class BottomNavBar extends StatelessWidget {
  final plantNameController = TextEditingController(text: "");
  final selectedColor = ColorUtil.darken(ColorUtil.primaryColor, .1);
  final unSelectedColor = ColorUtil.darken(ColorUtil.white, .3);
  final iconSize = 34.0;

  createNavigationItem(String iconPath, Page page) {
    return new BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(iconPath, height: iconSize, color: selectedColor),
      icon: SvgPicture.asset(iconPath, height: iconSize, color: unSelectedColor),
      title: Text(describeEnum(page)),
    );
  }

  createEmptyNavigationItem() {
    return new BottomNavigationBarItem(
      icon: SvgPicture.asset("assets/icons/can.svg", height: iconSize, color: Colors.transparent),
      title: Text(""),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mainStore = Provider.of<MainStore>(context);
    return FadeInUp(
      opacityStart: 1.0,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Observer(
          builder: (_) => BottomNavigationBar(
            backgroundColor: ColorUtil.navigationBarColor,
            iconSize: iconSize,
            elevation: 0.0,
            currentIndex: mainStore.currentPage.index,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
              createNavigationItem("assets/icons/sucus.svg", Page.values[0]),
              createNavigationItem("assets/icons/can.svg", Page.values[1]),
              createEmptyNavigationItem(),
              createNavigationItem("assets/icons/farmer.svg", Page.values[3]),
              createNavigationItem("assets/icons/shears.svg", Page.values[4]),
            ],
            onTap: (int index) {
              if (index == 2) return; //ignore the middle nav item.
              mainStore.setCurrentPage(Page.values[index]);
            },
          ),
        ),
      ),
    );
  }
}
