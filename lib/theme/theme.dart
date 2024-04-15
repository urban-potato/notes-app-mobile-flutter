import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainGreen),
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.mainDark,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    shape: const CircleBorder(),
    backgroundColor: AppColors.mainGreen,
  ),
  appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.mainDark,
      titleTextStyle: TextStyle(
        color: AppColors.mainTextDark,
        fontWeight: FontWeight.w700,
        fontSize: 28,
      )),
  listTileTheme: ListTileThemeData(
    iconColor: AppColors.secondaryTextDark,
  ),
  // buttonTheme: ButtonThemeData(
  //   textTheme: ButtonTextTheme.normal,
  // ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: AppColors.mainTextDark,
      fontWeight: FontWeight.w500,
      fontSize: 28,
    ),
    titleMedium: TextStyle(
      color: AppColors.mainTextDark,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    titleSmall: TextStyle(
      color: AppColors.secondaryTextDark,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      color: AppColors.thirdTextDark,
      fontWeight: FontWeight.w400,
      fontSize: 20,
    ),
  ),
);
