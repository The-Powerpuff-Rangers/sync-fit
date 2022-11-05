import 'package:flutter/material.dart';

class SyncFitTheme {
  static ThemeData get appTheme {
    return ThemeData(
        useMaterial3: true,
        fontFamily: 'SF-Pro Display',
        textTheme: const TextTheme(
          headline3: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              
              ),
        ));
  }
}
