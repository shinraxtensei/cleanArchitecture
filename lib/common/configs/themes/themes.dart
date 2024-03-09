
//? :  barel file for all themes
import 'package:flutter/material.dart';

export 'package:clean_architecture/common/configs/themes/dark_theme.dart';
export 'package:clean_architecture/common/configs/themes/light_theme.dart';



TextStyle getCustomTextStyle({
  String fontFamily = 'WorkSans',
  double fontSize = 16.0,
  FontWeight fontWeight = FontWeight.normal,
  double letterSpacing = 0.75,
}) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
  );
}