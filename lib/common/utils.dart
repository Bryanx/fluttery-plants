import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

Iterable<E> mapIndexed<E, T>(
    Iterable<T> items, E Function(int index, T item) f) sync* {
  var index = 0;

  for (final item in items) {
    yield f(index, item);
    index = index + 1;
  }
}

typedef StringCallback = Function(String string);

// Constants
const DB_NAME = "Plant";

loadImage(String imgPath) {
  return imgPath.contains("assets") ? AssetImage(imgPath) : FileImage(File(imgPath));
}

changeInterval(store, days) {
  return Padding(
    padding: const EdgeInsets.only(
        left: 16.0, top: 8.0, right: 16.0),
    child: Row(
      children: <Widget>[
        Text(
          "Every",
          style: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 18,
            color: Color(0xFFbbbfc2),
            fontWeight: FontWeight.w700,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 8.0, right: 4.0),
          child: Observer(
            builder: (_) => DropdownButton<int>(
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 18,
                color: Color(0xFF21293A),
                fontWeight: FontWeight.w700,
              ),
              value: store.plant.waterInterval,
              onChanged: (int newValue) {
                var plant = store.plant.copyWith(
                    waterInterval: newValue);
                store.updatePlant(plant);
              },
              items: days
                  .map<DropdownMenuItem<int>>(
                      (int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
            ),
          ),
        ),
        Text(
          "days.",
          style: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 18,
            color: Color(0xFFbbbfc2),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}