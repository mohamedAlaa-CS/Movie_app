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
);
