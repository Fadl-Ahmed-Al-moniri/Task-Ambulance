import 'package:flutter/material.dart';
import 'package:AmbulaceBooking/core/constant/color.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "Inter",
  cardColor: AppColor.white_2,
  textTheme: const TextTheme(
    headlineMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
    headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      shadows: [
        Shadow(color: AppColor.white, blurRadius: 10),
        // Shadow(color: AppColor.red, blurRadius: 20)
      ],
    ),
    titleSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    bodyMedium: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 15),
    bodySmall: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 20),
    labelSmall: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 10),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  cardColor: AppColor.white,
  textTheme: const TextTheme(
    headlineMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
    headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
    titleLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
    titleSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    bodyMedium: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 15),
    bodySmall: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 14),
    labelSmall: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 10),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);
