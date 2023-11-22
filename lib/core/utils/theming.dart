import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/color.dart';

ThemeData appTheme = ThemeData(
//  scaffoldBackgroundColor: kBlackColor,
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: kPrimaryColor),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kGrayrColor,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: kPrimaryColor,
        size: 28.sp,
      ),
      selectedLabelStyle: TextStyle(
          fontSize: 10.sp, fontWeight: FontWeight.bold, color: Colors.red),
      selectedItemColor: kPrimaryColor,
      showSelectedLabels: true,
      elevation: 0,
      unselectedIconTheme: IconThemeData(
        color: kUnclectedColor,
        size: 26.sp,
      ),
      unselectedItemColor: kUnclectedColor,
      showUnselectedLabels: true,
      unselectedLabelStyle:
          TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold)),
);
