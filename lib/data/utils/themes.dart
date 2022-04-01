import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class MyThemes {
  static ThemeData light() {
    return ThemeData(
      fontFamily: GoogleFonts.openSans().fontFamily,
      scaffoldBackgroundColor: MyColors.white,
      drawerTheme: DrawerThemeData(backgroundColor: MyColors.white),
      dividerColor: MyColors.grey,
      iconTheme: IconThemeData(color: MyColors.grey),
      appBarTheme: AppBarTheme(
        backgroundColor: MyColors.white,
        elevation: 0,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: MyColors.grey,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        headline2: TextStyle(
          color: MyColors.dark,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        headline3: TextStyle(
          color: MyColors.blue,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      fontFamily: GoogleFonts.openSans().fontFamily,
      scaffoldBackgroundColor: MyColors.darkBlue,
      drawerTheme: DrawerThemeData(backgroundColor: MyColors.darkBlue),
      dividerColor: MyColors.white,
      iconTheme: IconThemeData(color: MyColors.white),
      appBarTheme: AppBarTheme(
        backgroundColor: MyColors.darkBlue,
        elevation: 0,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: MyColors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        headline2: TextStyle(
          color: MyColors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        headline3: TextStyle(
          color: MyColors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
