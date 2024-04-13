import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';

final darkTheme = ThemeData(
  // colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainGreen),
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
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: AppColors.mainTextDark,
      fontWeight: FontWeight.w500,
      fontSize: 28,
    ),
    bodySmall: TextStyle(
      color: AppColors.secondaryTextDark,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    // bodyMedium: const TextStyle(
    //   color: Colors.white,
    //   fontWeight: FontWeight.w500,
    //   fontSize: 20,
    // ),
    // labelSmall: TextStyle(
    //   color: Colors.white.withOpacity(0.6),
    //   fontWeight: FontWeight.w700,
    //   fontSize: 14,
    // ),
    // headlineMedium: const TextStyle(
    //   color: Colors.white,
    //   fontWeight: FontWeight.w500,
    //   fontSize: 20,
    // ),
  ),
);
