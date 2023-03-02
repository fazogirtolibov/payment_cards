import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:last_exam/utils/color.dart';

class AppTheme {
  /// Light mode

  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: MyColors.black,
      ),
      backgroundColor: MyColors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    ),
    dialogBackgroundColor: MyColors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: MyColors.white,
      elevation: 8,
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: MyColors.white,
      elevation: 6,
    ),
    hintColor: MyColors.C_9E9E9E,
    scaffoldBackgroundColor: MyColors.white,
    colorScheme: const ColorScheme.light(),
    primaryColorDark: MyColors.white,
    primaryColor: MyColors.white,
    useMaterial3: true,
    cardColor: MyColors.primary,
    shadowColor: MyColors.C_04060F.withOpacity(0.5),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: MyColors.black),
    splashColor: MyColors.C_9E9E9E,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.raleway(
        textStyle: TextStyle(
            color: MyColors.C_212121,
            fontSize: 57.sp,
            fontWeight: FontWeight.w800),
      ),
      displayMedium: GoogleFonts.raleway(
        textStyle: TextStyle(
            color: MyColors.C_212121,
            fontSize: 45.sp,
            fontWeight: FontWeight.w700),
      ),
      displaySmall: GoogleFonts.raleway(
        textStyle: TextStyle(
            color: MyColors.C_212121,
            fontSize: 36.sp,
            fontWeight: FontWeight.w600),
      ),
      headlineMedium: GoogleFonts.raleway(
        textStyle: TextStyle(
            color: MyColors.C_212121,
            fontSize: 28.sp,
            fontWeight: FontWeight.w500),
      ),
      headlineSmall: GoogleFonts.raleway(
        textStyle: TextStyle(
            color: MyColors.C_212121,
            fontSize: 24.sp,
            fontWeight: FontWeight.w400),
      ),
      titleLarge: GoogleFonts.raleway(
        textStyle: TextStyle(
            color: MyColors.C_212121,
            fontSize: 22.sp,
            fontWeight: FontWeight.w300),
      ),
      labelMedium: GoogleFonts.raleway(
        textStyle: TextStyle(
            color: MyColors.C_212121,
            fontSize: 16.sp,
            fontWeight: FontWeight.w200),
      ),
    ),
  );

  /// Dark mode

  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: MyColors.white,
      ),
      backgroundColor: MyColors.C_181A20,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    ),
    dialogBackgroundColor: MyColors.C_1F222A,
    popupMenuTheme: const PopupMenuThemeData(
      color: MyColors.black,
      elevation: 6,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MyColors.C_181A20.withOpacity(0.85),
      elevation: 8,
    ),
    useMaterial3: true,
    splashColor: MyColors.C_04060F,
    hintColor: MyColors.C_9E9E9E,
    cardColor: MyColors.primary,
    scaffoldBackgroundColor: MyColors.C_181A20,
    primaryColor: MyColors.black,
    colorScheme: const ColorScheme.dark(),
    primaryColorDark: MyColors.black,
    shadowColor: MyColors.C_04060F.withOpacity(0.5),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: MyColors.white),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.raleway(
        textStyle: TextStyle(
            color: MyColors.white,
            fontSize: 57.sp,
            fontWeight: FontWeight.w800),
      ),
      displayMedium: GoogleFonts.raleway(
        textStyle: TextStyle(
            color: MyColors.white,
            fontSize: 45.sp,
            fontWeight: FontWeight.w700),
      ),
      displaySmall: GoogleFonts.raleway(
        textStyle: TextStyle(
            color: MyColors.white,
            fontSize: 36.sp,
            fontWeight: FontWeight.w600),
      ),
      headlineMedium: GoogleFonts.raleway(
        textStyle: TextStyle(
            color: MyColors.white,
            fontSize: 28.sp,
            fontWeight: FontWeight.w500),
      ),
      headlineSmall: GoogleFonts.raleway(
        textStyle: TextStyle(
            color: MyColors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.w400),
      ),
      titleLarge: GoogleFonts.raleway(
        textStyle: TextStyle(
            color: MyColors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.w300),
      ),
      labelMedium: GoogleFonts.raleway(
        textStyle: TextStyle(
            color: MyColors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w200),
      ),
    ),
  );
}
