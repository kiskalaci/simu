import "package:flutter/material.dart";

/// Custom color palette
@immutable
class ColorPalette extends ThemeExtension<ColorPalette> {
  const ColorPalette({
    this.background = LightPalette.lightGrey,
    this.lightGrey = LightPalette.lightGrey,
    this.secondary = LightPalette.secondary,
    this.blueGrey = LightPalette.blueGrey,
    this.darkBlue = LightPalette.darkBlue,
    this.primary = LightPalette.primary,
    this.darkRed = LightPalette.darkRed,
    this.green = LightPalette.green,
    this.grey = LightPalette.grey,
    this.blue = LightPalette.blue,
    this.red = LightPalette.red,
    this.white = Colors.white,
    this.black = Colors.black,
  });

  final Color primary;
  final Color secondary;
  final Color background;
  final Color blue;
  final Color darkBlue;
  final Color red;
  final Color darkRed;
  final Color green;
  final Color lightGrey;
  final Color grey;
  final Color blueGrey;
  final Color white;
  final Color black;

  static ColorPalette of(BuildContext context) =>
      Theme.of(context).extension<ColorPalette>() ?? const ColorPalette();

  @override
  ColorPalette copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? blue,
    Color? red,
    Color? darkRed,
    Color? green,
    Color? lightGrey,
    Color? grey,
    Color? blueGrey,
  }) => ColorPalette(
    primary: primary ?? this.primary,
    secondary: secondary ?? this.secondary,
    background: background ?? this.background,
    blue: blue ?? this.blue,
    red: red ?? this.red,
    darkRed: darkRed ?? this.darkRed,
    green: green ?? this.green,
    lightGrey: lightGrey ?? this.lightGrey,
    grey: grey ?? this.grey,
    blueGrey: blueGrey ?? this.blueGrey,
  );

  @override
  ColorPalette lerp(ThemeExtension<ColorPalette>? other, double t) {
    if (other is! ColorPalette) {
      return this;
    }

    return ColorPalette(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      red: Color.lerp(red, other.red, t)!,
      darkRed: Color.lerp(darkRed, other.darkRed, t)!,
      green: Color.lerp(green, other.green, t)!,
      lightGrey: Color.lerp(lightGrey, other.lightGrey, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      blueGrey: Color.lerp(blueGrey, other.blueGrey, t)!,
    );
  }
}

abstract class LightPalette {
  static const Color lightGrey = Color(0xFFF3F4F6);
  static const Color grey = Color(0xFFD1D5DB);
  static const Color green = Color(0xFF16A34A);
  static const Color blue = Color(0xFF2563EB);
  static const Color darkBlue = Color(0xFF1e40b0);
  static const Color red = Color(0xFFDC2626);
  static const Color darkRed = Color(0xFFB91C1C);
  static const Color blueGrey = Color(0xFF7088A8);
  static const Color primary = Color(0xFF374151);
  static const Color secondary = Color(0xFF4B5563);
}
