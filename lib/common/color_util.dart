import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ColorUtil {
  static const primaryColor = Color(0xFFA6C688);
  static const secondaryColor = Color(0xFF30738E);
  static const accentColor = Color(0xFFA6C688);
  static const backgroundColor = Color(0xFFF5F6F3);
  static const navigationBarColor = Color(0xFFFAFBF9);
  static const grey = Color(0x4D21293A);
  static const solidGrey = Color(0xFFDBDBDB);
  static const headerColor = Color(0xFF7B7B7B);
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const red = Color(0xFFFF6368);

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