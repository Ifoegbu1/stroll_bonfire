import 'package:flutter/material.dart';
import 'package:stroll_bonfire/core/theme/app_colors.dart';

ThemeData darkTheme = ThemeData.dark();
ThemeData lightTheme = ThemeData.light();

ThemeData appDarkTheme = darkTheme.copyWith(
  textTheme: darkTheme.textTheme.apply(
    fontFamily: 'ProximaNova',
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black12,
    iconTheme: IconThemeData(color: Colors.white70),
  ),
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
  ),
);

ThemeData appLightTheme = lightTheme.copyWith(
  textTheme: lightTheme.textTheme.apply(
    fontFamily: 'ProximaNova',
  ),
  appBarTheme: const AppBarTheme(
    // backgroundColor: Colors.wh`ite,
    iconTheme: IconThemeData(color: Colors.black87),
  ),
  primaryColor: AppColors.primaryClr,
  primaryColorLight: AppColors.primaryClr,
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    primary: AppColors.primaryClr,
  ),
);
