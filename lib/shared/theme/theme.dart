import 'package:flutter/material.dart';

abstract class CustomTheme {
  static ThemeData customTheme = ThemeData(
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 13,
      ),
      subtitle1: TextStyle(
        color: Colors.black,
        fontSize: 12,
      ),
      subtitle2: TextStyle(
        color: Colors.black,
        fontSize: 11,
      ),
    ),
  );
}
