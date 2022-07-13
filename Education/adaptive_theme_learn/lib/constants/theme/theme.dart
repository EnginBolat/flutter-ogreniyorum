import 'package:flutter/material.dart';

class ConstThemes {
  final lightTheme = ThemeData(
    primarySwatch: Colors.brown,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
