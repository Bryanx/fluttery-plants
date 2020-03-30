import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttering_plants/common/utils.dart';

class PlantCard extends StatelessWidget {
  final plant;
  final tag;
  final height = 170.0;

  PlantCard({this.plant, this.tag});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.transparent,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 0.0,
        child: Hero(
            tag: tag,
            child: Stack(
              children: <Widget>[
                Container(
                    height: height,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: loadImage(plant.imgPath),
                      fit: BoxFit.cover,
                    ))),
                Container(
                  height: height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.grey.withOpacity(0.0),
                            Colors.black54,
                          ],
                          stops: [
                            0.0,
                            1.0
                          ])),
                ),
                Container(
                    height: height,
                    alignment: Alignment.bottomLeft,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: Text(
                            plant.nickName,
                            style: TextStyle(
                              fontFamily: "AlegreyaSans",
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          "Needs water in 5 days",
                          style: TextStyle(
                            fontFamily: "AlegreyaSans",
                            fontSize: 20,
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ))
              ],
            )));
  }
}
