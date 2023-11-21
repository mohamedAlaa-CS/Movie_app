import 'package:flutter/material.dart';
import 'package:movie/core/utils/color.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: kBlackColor,
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: kPrimaryColor),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kGrayrColor,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: kPrimaryColor,
        size: 28,
      ),
      selectedLabelStyle: TextStyle(
          fontSize: 10, fontWeight: FontWeight.bold, color: Colors.red),
      selectedItemColor: kPrimaryColor,
      showSelectedLabels: true,
      elevation: 0,
      unselectedIconTheme: IconThemeData(
        color: kUnclectedColor,
        size: 26,
      ),
      unselectedItemColor: kUnclectedColor,
      showUnselectedLabels: true,
      unselectedLabelStyle:
          TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
);
