import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.orange,
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.grey,
      selectedIconTheme: IconThemeData(color: Colors.black, size: 36),
      unselectedIconTheme: IconThemeData(color: Colors.grey, size: 24),
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(color: Colors.white,fontSize: 24),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );
}
