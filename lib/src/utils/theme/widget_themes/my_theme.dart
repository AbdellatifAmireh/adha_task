import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_input_theme.dart';



class MyTheme {
  // To make the class private and prevent any one to make instance from it
  MyTheme._();

  static ThemeData lightTheme = ThemeData(
    // brightness: Brightness.light,
    inputDecorationTheme:
        MyInputTheme().theme(), // custom theme for the form fields
    colorScheme:
        ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 214, 171, 31)),
    useMaterial3: true,
    //textTheme: TTextTheme.lightTextTheme,
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.montserrat(
        color: Colors.black87,
        fontSize: 30,
      ),
    ),
  );
}
