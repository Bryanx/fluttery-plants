import 'package:flutter/material.dart';

///
/// Contains the theme for the app.
///
final ThemeData appTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  primaryColor: Colors.lightBlue[800],
  accentColor: Colors.cyan[600],
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,

  // Define the default font family.
  fontFamily: 'Georgia',

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    title: TextStyle(
      fontSize: 44.0,
      fontFamily: 'AlegreyaSans',
      color: Color(0xFF21293A),
      fontWeight: FontWeight.w700,
    ),
    headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),

  ),
);
