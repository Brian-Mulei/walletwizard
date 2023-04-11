
import 'package:flutter/material.dart';

const lightMarine =Color(0xFF6fffe9);
const darkMarine =Color(0xFF5bc0be);
const navyBlue =Color(0xFF1c2541);
const lightNavy =Color(0xFF3A506B);
const veryDarkBlue = Color(0xFF0B132B);
const white = Color(0xFFEAEAEA);
const lightGrey = Color(0xFFBBBBBB);
const black = Color(0xFF202020);
const darkGrey =Color(0xFF505050);

ColorScheme lightThemeColors(context) {
  return const ColorScheme(
    brightness: Brightness.light,
    primary: veryDarkBlue,
    onPrimary:darkMarine,
    secondary: lightGrey,
    onSecondary: white,
    error: Color(0xFFF32424),
    onError: Color(0xFFF32424),
    background: white,
    onBackground: lightNavy,
    surface: Color(0xFF54B435),
    onSurface: Color(0xFF54B435),
  );
}

ColorScheme darkThemeColors(context) {
  return const ColorScheme(
    brightness: Brightness.dark,
    primary: lightMarine,
    onPrimary: white,
    secondary: lightNavy,
    onSecondary: lightNavy,
    error: Color(0xFFF32424),
    onError: Color(0xFFF32424),
    background: black,
    onBackground: darkGrey,
    surface: Color(0xFF54B435),
    onSurface: Color(0xFF54B435),
  );
}

