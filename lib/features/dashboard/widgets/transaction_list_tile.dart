import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:simu/models/transaction.dart";
import "package:simu/theme/color_palette.dart";
import "package:simu/theme/typography.dart";

class TransactionListTile extends ConsumerWidget {
  const TransactionListTile({required this.details, this.onTap, super.key});

  final Transaction details;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ColorPalette.of(context);
    final typography = Typo.of(context);

    // TODO(dev): use proper formatting (intl).
    final amountLabel = "${details.amount} ${details.currency}";

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  details.date ?? "",
                  style: typography.body.colored(colors.primary),
                ),
                Text(
                  details.merchant ?? "",
                  style: typography.body.colored(colors.secondary),
                ),
              ],
            ),
          ),
          Text(
            amountLabel,
            style: typography.body.bold.colored(colors.darkRed),
          ),
        ],
      ),
    );
  }
}
