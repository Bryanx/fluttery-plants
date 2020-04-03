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
import 'package:fluttering_plants/screens/navigation/page.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:fluttering_plants/stores/plant_list_store.dart';
import 'package:provider/provider.dart';

///
/// The bottom navigationbar of the app.
///
class NavigationBar extends StatelessWidget {
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
    return Align(
      alignment: Alignment.bottomCenter,
      child: Observer(
        builder: (_) => BottomNavigationBar(
          backgroundColor: Colors.white,
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
    );
  }

  void showAddModal(BuildContext context, PlantListStore plantList) {
    showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          context: context,
          builder: (builder) {
            return Container(
              color: Colors.transparent,
              child: new Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: new Container(
                  height: 230,
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0))),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 15, top: 25.0, right: 15, bottom: 30),
                    child: ListView(
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                controller: plantNameController,
                                textInputAction: TextInputAction.done,
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w400),
                                autofocus: true,
                                decoration: const InputDecoration(
                                    hintText: 'Give your plant a name.',
                                    labelText: 'New Plant',
                                    labelStyle: TextStyle(
                                        color: Colors.indigoAccent,
                                        fontWeight: FontWeight.w500)),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Empty name!';
                                  }
                                  return value.contains('')
                                      ? 'Do not use the @ char.'
                                      : null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5, top: 15),
                              child: CircleAvatar(
                                backgroundColor: Colors.indigoAccent,
                                radius: 18,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.save,
                                    size: 22,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    final newPlant = Plant(
                                        nickName:
                                        plantNameController.value.text);
                                    if (newPlant.name.isNotEmpty) {
                                      plantList.add(newPlant);
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
  }
}
