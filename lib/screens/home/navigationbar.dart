import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttering_plants/utils/custom_icons.dart';
import 'package:fluttering_plants/model/plant.dart';
import 'package:fluttering_plants/screens/home/plant_list_store.dart';
import 'package:provider/provider.dart';

class NavigationBar extends StatelessWidget {
  final plantNameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final plantList = Provider.of<PlantListStore>(context);
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      backgroundColor: Colors.white,
      elevation: 0.0,
      currentIndex: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        new BottomNavigationBarItem(
          icon: Icon(CustomIcons.home_outline, size: 18),
          title: Text(''),
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline, size: 26),
          title: Text(''),
        ),
        new BottomNavigationBarItem(
            icon: Icon(CustomIcons.notifications_none, size: 26),
            title: Text(''))
      ],
      onTap: (int index) {
        if (index == 0) {
        }
        else if (index == 1)
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
      },
    );
  }
}
