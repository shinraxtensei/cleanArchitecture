//? : color scheem and text style for dark theme

import 'package:flutter/material.dart';

import 'themes.dart';




final ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    
    primary:  Color(0xFFE52F32),
    onPrimary:  Color(0xFFFFFFFF),
    
    secondary:  Color(0xFF20B37C),
    onSecondary:  Color(0xFFFFFFFF),

    
    tertiary:  Color(0xFF4BABF1),
    onTertiary:  Color(0xFF000000),
    
    background:  Color(0xFF4A4A68),
    onBackground:  Color(0xFFFFFFFF),

    surface:  Color(0xFF363A41),
    onSurface:  Color(0xFFFFFFFF),
    
    error:  Color(0xFFB00020),
    onError:  Color(0xFFFFFFFF),

  ),

  textTheme: TextTheme(
    displayLarge: getCustomTextStyle(fontSize: 48.0, fontWeight: FontWeight.w700),
    displayMedium: getCustomTextStyle(fontSize: 36.0, fontWeight: FontWeight.w700),
    displaySmall: getCustomTextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
    headlineLarge: getCustomTextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
    headlineMedium: getCustomTextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
    headlineSmall: getCustomTextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
    titleLarge: getCustomTextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
    titleMedium: getCustomTextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
    titleSmall: getCustomTextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
    bodyLarge: getCustomTextStyle(fontSize: 18.0),
    bodyMedium: getCustomTextStyle(fontSize: 16.0),
    bodySmall: getCustomTextStyle(fontSize: 14.0),
    labelLarge: getCustomTextStyle(fontSize: 18.0, letterSpacing: 0.5),
    labelMedium: getCustomTextStyle(fontSize: 16.0, letterSpacing: 0.5),
    labelSmall: getCustomTextStyle(fontSize: 14.0, letterSpacing: 0.5),
  ),

  useMaterial3: true,
);