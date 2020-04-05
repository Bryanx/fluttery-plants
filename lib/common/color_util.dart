import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ColorUtil {
  static final primaryColor = Color(0xFFA6C688);
  static final secondaryColor = Color(0xFF30738E);
  static final accentColor = Color(0xFFA6C688);
  static final backgroundColor = Color(0xFFF5F6F3);
  static final grey = Color(0x4D21293A);
  static final solidGrey = Color(0xFFDBDBDB);
  static final headerColor = Color(0xFF7B7B7B);
  static final black = Color(0xFF000000);
  static final white = Color(0xFFFFFFFF);

  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  static Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }
}