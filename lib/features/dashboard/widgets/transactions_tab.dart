import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:simu/features/auth/providers/auth_provider.dart";
import "package:simu/features/dashboard/providers/transactions_provider.dart";
import "package:simu/features/common/widgets/modal_sheet.dart";
import "package:simu/features/dashboard/widgets/transaction_list_tile.dart";
import "package:simu/i18n/strings.g.dart";
import "package:simu/models/transaction.dart";
import "package:simu/theme/color_palette.dart";
import "package:simu/theme/spacing.dart";
import "package:simu/theme/typography.dart";

class TransactionsTab extends ConsumerWidget {
  const TransactionsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ColorPalette.of(context);
    final typography = Typo.of(context);
    final transactions = ref.watch(transactionsProvider);
    final user = ref.watch(authProvider);

    const horizontalPadding = EdgeInsets.symmetric(horizontal: Spacing.triple);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacing.xl.verticalGap,
        Padding(
          padding: horizontalPadding,
          child: RichText(
            text: TextSpan(
              text: "${t.hello}, ",
              style: typography.title.colored(colors.primary),
              children: <TextSpan>[
                TextSpan(
                  text: user?.name,
                  style: typography.title.bold.colored(colors.primary),
                ),
              ],
            ),
          ),
        ),
        Spacing.xl.verticalGap,

        Padding(
          padding: horizontalPadding,
          child: Row(
            spacing: Spacing.doubled,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.filter_alt_outlined,
                  color: colors.blue,
                  size: Spacing.triple,
                ),
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: t.search,
                    suffixIcon: const Icon(Icons.search_outlined),
                  ),
                ),
              ),
            ],
          ),
        ),
        Spacing.xl.verticalGap,

        Expanded(
          child: Center(
            child: transactions.when(
              data: (data) {
                if (data == null) {
                  return Text(
                    t.errorHasOccurred,
                    style: typography.body.colored(colors.primary),
                  );
                }

                if (data.isEmpty) {
                  return Text(
                    t.transactions.noTransactions,
                    style: typography.body.colored(colors.primary),
                  );
                }

                return ListView.separated(
                  padding: horizontalPadding.copyWith(bottom: Spacing.large),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final details = data.elementAt(index);
                    return TransactionListTile(
                      details: details,
                      onTap:
                          () => showTransactionDetailsModal(
                            context: context,
                            details: details,
                          ),
                    );
                  },
                  separatorBuilder:
                      (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: Spacing.baseStep,
                        ),
                        child: Divider(color: colors.grey),
                      ),
                );
              },
              error: (_, __) => Text(t.errorHasOccurred),
              loading: () => const CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }

  void showTransactionDetailsModal({
    required BuildContext context,
    required Transaction details,
  }) {
    final colors = ColorPalette.of(context);
    final typography = Typo.of(context);

    // TODO(dev): use proper formatting (intl).
    final amountLabel = "${details.amount} ${details.currency}";

    final content = DefaultTextStyle(
      style: typography.body.light.colored(colors.primary),
      child: Column(
        spacing: Spacing.doubled,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              Text(details.description ?? ""),
              Text(
                amountLabel,
                style: typography.body.black.colored(colors.darkRed),
              ),
            ],
          ),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [Text(t.transactions.date), Text(details.date ?? "")],
          ),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              Text(t.transactions.merchant),
              Text(details.merchant ?? ""),
            ],
          ),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              Text(t.transactions.category),
              Text(details.category ?? ""),
            ],
          ),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              Text(t.transactions.toAccount),
              Text(details.toAccount ?? ""),
            ],
          ),
          Spacing.triple.verticalGap,
        ],
      ),
    );

    ModalSheet.show(
      title: t.transactions.transactionDetails,
      context: context,
      child: content,
    );
  }
}
