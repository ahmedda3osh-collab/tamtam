import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    fontFamily: "Poppins",
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
  );
}
