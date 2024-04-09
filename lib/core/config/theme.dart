 import 'package:book_library/core/config/color.dart';
import 'package:flutter/material.dart';

class AppTheme{

  static ThemeData lightTheme = ThemeData(
    brightness:Brightness.light,
    cardColor:AppColor.background,
    colorScheme:ColorScheme.light(brightness: Brightness.light,background: AppColor.light),
    dialogBackgroundColor:AppColor.light,
    primaryColor:AppColor.light,
    primaryColorDark:AppColor.light,
    primaryColorLight:AppColor.light,
    scaffoldBackgroundColor:AppColor.light,
    secondaryHeaderColor:AppColor.light,
    drawerTheme:  DrawerThemeData(
      scrimColor: AppColor.transparent,
      backgroundColor: AppColor.light
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColor.light,
      ),
    ),
  );



  static ThemeData darkTheme = ThemeData(
    brightness:Brightness.dark,
    cardColor:AppColor.background,
    colorScheme:ColorScheme.dark(brightness: Brightness.dark,background: AppColor.dark),
    dialogBackgroundColor:AppColor.dark,
    primaryColor:AppColor.dark,
    primaryColorDark:AppColor.dark,
    primaryColorLight:AppColor.light,
    scaffoldBackgroundColor:AppColor.dark,
    secondaryHeaderColor:AppColor.dark,
    drawerTheme:  DrawerThemeData(
        scrimColor: AppColor.transparent,
        backgroundColor: AppColor.light
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColor.light,
      ),
    ),
  );
 }