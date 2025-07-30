import 'package:flutter/material.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFFF4F8FC),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
    displayMedium: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
    displaySmall: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
    headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
    titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(fontSize: 16),
    bodyMedium: TextStyle(fontSize: 14),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
  ),
  fontFamily: 'Inter',
);
