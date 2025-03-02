import "package:flutter/material.dart";

@immutable
class Typo extends ThemeExtension<Typo> {
  Typo({
    TextStyle? h1,
    TextStyle? lead,
    TextStyle? title,
    TextStyle? subtitle,
    TextStyle? body,
    TextStyle? small,
    TextStyle? tiny,
    this.fontFamily = "fontFamily",
  }) {
    this.h1 = h1 ?? $h1.copyWith(fontFamily: fontFamily);
    this.lead = lead ?? $lead.copyWith(fontFamily: fontFamily);
    this.title = title ?? $title.copyWith(fontFamily: fontFamily);
    this.subtitle = subtitle ?? $subtitle.copyWith(fontFamily: fontFamily);
    this.body = body ?? $body.copyWith(fontFamily: fontFamily);
    this.small = small ?? $small.copyWith(fontFamily: fontFamily);
    this.tiny = tiny ?? $tiny.copyWith(fontFamily: fontFamily);
  }
  final String fontFamily;

  /// FontSize 30px
  late final TextStyle h1;

  /// FontSize 24px
  late final TextStyle lead;

  /// FontSize 20px
  late final TextStyle title;

  /// FontSize 18px
  late final TextStyle subtitle;

  /// FontSize 16px
  late final TextStyle body;

  /// FontSize 14px
  late final TextStyle small;

  /// FontSize 12px
  late final TextStyle tiny;

  /// FontSize 30px
  static const $h1 = TextStyle(
    fontSize: FontSize.xxxl,
    fontWeight: FontWeight.w400,
  );

  /// FontSize 24px
  static const $lead = TextStyle(
    fontSize: FontSize.xxl,
    fontWeight: FontWeight.w400,
  );

  /// FontSize 20px
  static const $title = TextStyle(
    fontSize: FontSize.xl,
    fontWeight: FontWeight.w400,
  );

  /// FontSize 18px
  static const $subtitle = TextStyle(
    fontSize: FontSize.large,
    fontWeight: FontWeight.w400,
  );

  /// FontSize 16px
  static const $body = TextStyle(
    fontSize: FontSize.medium,
    fontWeight: FontWeight.w400,
  );

  /// FontSize 14px
  static const $small = TextStyle(
    fontSize: FontSize.small,
    fontWeight: FontWeight.w400,
  );

  /// FontSize 12px
  static const $tiny = TextStyle(
    fontSize: FontSize.tiny,
    fontWeight: FontWeight.w400,
  );

  static Typo of(BuildContext context) =>
      Theme.of(context).extension<Typo>() ?? Typo();

  @override
  Typo copyWith({
    TextStyle? h1,
    TextStyle? lead,
    TextStyle? title,
    TextStyle? subtitle,
    TextStyle? body,
    TextStyle? small,
    TextStyle? tiny,
  }) => Typo(
    h1: h1 ?? this.h1,
    lead: lead ?? this.lead,
    title: title ?? this.title,
    subtitle: subtitle ?? this.subtitle,
    body: body ?? this.body,
    small: small ?? this.small,
    tiny: tiny ?? this.tiny,
  );

  @override
  Typo lerp(Typo? other, double t) {
    if (other is! Typo) {
      return this;
    }
    return Typo(
      h1: TextStyle.lerp(h1, other.h1, t) ?? h1,
      lead: TextStyle.lerp(lead, other.lead, t) ?? lead,
      title: TextStyle.lerp(title, other.title, t) ?? title,
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t) ?? subtitle,
      body: TextStyle.lerp(body, other.body, t) ?? body,
      small: TextStyle.lerp(small, other.small, t) ?? small,
      tiny: TextStyle.lerp(tiny, other.tiny, t) ?? tiny,
    );
  }
}

class FontSize {
  ///12
  static const double tiny = 12;

  ///14
  static const double small = 14;

  ///16
  static const double medium = 16;

  ///18
  static const double large = 18;

  ///20
  static const double xl = 20;

  ///24
  static const double xxl = 24;

  ///30
  static const double xxxl = 30;
}

/// FontWeight.w300;
const lightWeight = FontWeight.w300;

/// FontWeight.w400;
const regularWeight = FontWeight.w400;

/// FontWeight.w600;
const semiBoldWeight = FontWeight.w600;

/// FontWeight.w700;
const boldWeight = FontWeight.w700;

/// FontWeight.w900;
const blackWeight = FontWeight.w900;

extension TextStyleExtension on TextStyle {
  TextStyle colored(Color color) => copyWith(color: color);

  /// FontWeight.w300;
  TextStyle get light => copyWith(fontWeight: lightWeight);

  /// FontWeight.w400;
  TextStyle get regular => copyWith(fontWeight: regularWeight);

  /// FontWeight.w700;
  TextStyle get semiBold => copyWith(fontWeight: semiBoldWeight);

  /// FontWeight.w900;
  TextStyle get bold => copyWith(fontWeight: boldWeight);

  /// FontWeight.w900;
  TextStyle get black => copyWith(fontWeight: blackWeight);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle get normal => copyWith(fontStyle: FontStyle.normal);
}
