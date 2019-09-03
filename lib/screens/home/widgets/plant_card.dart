import 'package:flutter/material.dart';
import 'package:fluttering_plants/utils/utils.dart';

class PlantCard extends StatelessWidget {
  final plant;
  final tag;

  PlantCard(this.plant, this.tag);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.transparent,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        elevation: 0.0,
        child: Hero(
            tag: tag,
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: loadImage(plant.imgPath),
                  fit: BoxFit.cover,
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        decoration: new BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: new BorderRadius.only(
                                topRight: Radius.circular(24.0),
                                bottomLeft: Radius.circular(24.0))),
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 15.0),
                        child: Text(
                          plant.nickName,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ))
                  ],
                ))));
  }
}
