import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.rubikTextTheme().copyWith(
        headlineMedium: TextStyle(color: Colors.black),
        headlineSmall: TextStyle(color: Colors.black),
        headlineLarge: TextStyle(color: Colors.black)),
    //cardColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.blue),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedLabelStyle: TextStyle(color: Colors.black)),
    colorScheme:
        ColorScheme.light(primary: Colors.blue, secondary: Colors.blue),
    scaffoldBackgroundColor: Colors.grey[100]);

class Styling {
  // These breakpoints come straight from tailwindcss. We are only going to be using the md and large one here.
  static const breakpoint_sm = 640;
  static const breakpoint_md = 768;
  static const breakpoint_lg = 1024;
  static const breakpoint_xl = 1280;

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > breakpoint_lg;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > breakpoint_md;
  }
}
