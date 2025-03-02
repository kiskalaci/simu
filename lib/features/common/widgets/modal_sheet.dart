import "package:flutter/material.dart";
import "package:simu/theme/color_palette.dart";
import "package:simu/theme/spacing.dart";
import "package:simu/theme/typography.dart";

abstract class ModalSheet {
  static void show<T>({
    required BuildContext context,
    required Widget child,
    required String title,
    bool isScrollControlled = true,
    bool isDismissible = true,
    Color? backgroundColor,
    Color? paneColor,
  }) {
    showModalBottomSheet<T>(
      context: context,
      useSafeArea: true,
      backgroundColor: backgroundColor,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      clipBehavior: Clip.hardEdge,
      builder: (ctx) {
        final colors = ColorPalette.of(context);
        final typography = Typo.of(context);

        return DecoratedBox(
          decoration: BoxDecoration(
            color: paneColor ?? colors.lightGrey,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(Spacing.baseStep),
              topRight: Radius.circular(Spacing.baseStep),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: MediaQuery.of(ctx).viewInsets,
              child: Padding(
                padding: const EdgeInsets.all(Spacing.doubled),
                child: Column(
                  spacing: Spacing.triple,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: Navigator.of(context).pop,
                          icon: Icon(Icons.close, color: colors.blue),
                        ),
                      ],
                    ),
                    Text(
                      title,
                      style: typography.lead.bold.colored(colors.blue),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: double.infinity,
                        child: SingleChildScrollView(child: child),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
