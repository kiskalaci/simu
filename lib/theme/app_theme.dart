import "package:flutter/material.dart";
import "package:simu/theme/color_palette.dart";
import "package:simu/theme/spacing.dart";
import "package:simu/theme/typography.dart";

ThemeData get lightTheme {
  const colors = ColorPalette();
  final typography = Typo();
  return ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: colors.lightGrey,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      foregroundColor: colors.darkBlue,
      titleTextStyle: typography.h1.bold.colored(colors.darkBlue),
      backgroundColor: colors.lightGrey,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      focusColor: colors.blue,
      fillColor: colors.lightGrey,
      labelStyle: typography.body.colored(colors.primary),
      hintStyle: typography.body.colored(colors.grey),
      suffixIconColor: colors.blue,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Spacing.twelve),
        borderSide: BorderSide(color: colors.blueGrey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Spacing.twelve),
        borderSide: BorderSide(color: colors.red),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Spacing.twelve),
        borderSide: BorderSide(color: colors.blueGrey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Spacing.twelve),
        borderSide: BorderSide(color: colors.blueGrey, width: 2),
      ),
    ),
    // searchBarTheme: SearchBarThemeData(
    //   backgroundColor: WidgetStatePropertyAll(colors.background5),
    //   elevation: const WidgetStatePropertyAll(0),
    //   textStyle: WidgetStatePropertyAll(typo.body),
    //   hintStyle: WidgetStatePropertyAll(
    //     typo.body.colored(
    //       colors.secondary,
    //     ),
    //   ),

    // searchViewTheme: SearchViewThemeData(
    //   backgroundColor: colors.background5,
    //   headerTextStyle: typo.body,
    //   headerHintStyle: typo.body,
    //   dividerColor: colors.secondary,
    // ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: colors.white,
        backgroundColor: colors.blue,

        minimumSize: const Size(0, Spacing.huge),
        textStyle: typography.subtitle.bold,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Spacing.twelve)),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colors.secondary,
        textStyle: typography.subtitle.light,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: colors.primary,
      unselectedItemColor: colors.secondary,
      selectedLabelStyle: typography.small,
    ),
    extensions: [colors, typography],
  );
}
