import 'package:flutter/material.dart';
import 'package:recpie_app/app_utils.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 201, 201, 201),
    fontFamily: "Montserrat Bold",

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.w500,
          fontFamily: "Montserrat Regular",
        ),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),

    // Global text field design via inputDecorationTheme
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.all(15),
      border: OutlineInputBorder(),
      labelStyle: TextStyle(
        fontSize: 20,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orange),
      ),
    ),

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: colorPrimary,
    ),
  );
}
