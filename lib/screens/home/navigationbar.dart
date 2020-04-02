import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttering_plants/common/custom_icons.dart';
import 'package:fluttering_plants/model/plant.dart';
import 'package:fluttering_plants/stores/main_store.dart';
import 'package:fluttering_plants/stores/plant_list_store.dart';
import 'package:provider/provider.dart';

///
/// The bottom navigationbar of the app.
///

class NavigationBar extends StatelessWidget {
  final plantNameController = TextEditingController(text: "");
  final selectedColor = Colors.green;
  final unSelectedColor = Colors.grey;
  final iconSize = 38.0;

  @override
  Widget build(BuildContext context) {
    final mainStore = Provider.of<MainStore>(context);
    return Observer(
      builder: (_) => BottomNavigationBar(
        selectedItemColor: selectedColor,
        unselectedItemColor: unSelectedColor,
        backgroundColor: Color(0xCCFFFFFF),
        iconSize: iconSize,
        elevation: 0.0,
        currentIndex: mainStore.navigationIndex,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: [
          new BottomNavigationBarItem(
            activeIcon: SvgPicture.asset("assets/icons/sucus.svg", height: iconSize, color: selectedColor),
            icon: SvgPicture.asset("assets/icons/sucus.svg", height: iconSize, color: unSelectedColor),
            title: Text('Plants'),
          ),
          new BottomNavigationBarItem(
            activeIcon: SvgPicture.asset("assets/icons/can.svg", height: iconSize, color: selectedColor),
            icon: SvgPicture.asset("assets/icons/can.svg", height: iconSize, color: unSelectedColor),
            title: Text('Watering'),
          ),
          new BottomNavigationBarItem(
              activeIcon: SvgPicture.asset("assets/icons/shears.svg", height: iconSize, color: selectedColor),
              icon: SvgPicture.asset("assets/icons/shears.svg", height: iconSize, color: unSelectedColor),
              title: Text('Settings'))
        ],
        onTap: (int index) {
          mainStore.setNavigationIndex(index);
          switch (index) {
            case 0:
            case 1:
            case 2:
          }
        },
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
