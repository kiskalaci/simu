import "package:flutter/material.dart";
import "package:simu/i18n/strings.g.dart";
import "package:simu/theme/color_palette.dart";
import "package:simu/theme/typography.dart";

class Toast {
  static void showSuccess(BuildContext context, String message) {
    final color = ColorPalette.of(context);
    showSnackBar(context, message, color.green);
  }

  static void showError(BuildContext context, String message) {
    final color = ColorPalette.of(context);
    showSnackBar(context, message, color.red);
  }

  static void showSnackBar(BuildContext context, String message, Color color) {
    final colors = ColorPalette.of(context);
    final typography = Typo.of(context);
    final messenger = ScaffoldMessenger.of(context);

    messenger.showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                message,
                style: typography.body.colored(colors.white),
              ),
            ),
            TextButton(
              onPressed: messenger.hideCurrentSnackBar,
              child: Text(t.ok, style: typography.body.colored(colors.white)),
            ),
          ],
        ),

        backgroundColor: color,
        behavior: SnackBarBehavior.fixed,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
