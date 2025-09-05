import 'package:flutter/material.dart';
import 'package:market_app/core/configs/colors/index.dart';

class CTheme {
  static final lightTheme = ThemeData(
    primaryColor: CColors.primary,
    scaffoldBackgroundColor: CColors.lightBackground,
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      hintStyle: const TextStyle(
        color: Color.fromARGB(255, 208, 21, 21),
        fontWeight: FontWeight.w500
      ),
      contentPadding: const EdgeInsets.all(30),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 0.4
        )
      ),
      // enabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(30),
      //   borderSide: const BorderSide(
      //     color: Colors.black,
      //     width: 0.4
      //   )
      // )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: CColors.primary,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        )
      )
    )
  );

  static final darkTheme = ThemeData(
    primaryColor: CColors.primary,
    scaffoldBackgroundColor: CColors.darkBackground,
    brightness: Brightness.dark,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      hintStyle: const TextStyle(
        color: Color(0xffa7a7a7),
        fontWeight: FontWeight.w500
      ),
      contentPadding: const EdgeInsets.all(30),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 0.4
        )
      ),
      // enabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(30),
      //   borderSide: const BorderSide(
      //     color: Colors.white,
      //     width: 0.4
      //   )
      // )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: CColors.primary,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        )
      )
    )
  );
}
