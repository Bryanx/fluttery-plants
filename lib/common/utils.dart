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