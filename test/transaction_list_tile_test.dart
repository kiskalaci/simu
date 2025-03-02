import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:simu/features/dashboard/widgets/transaction_list_tile.dart";
import "package:simu/models/transaction.dart";

void main() {
  final transaction = Transaction(
    amount: 50.0,
    currency: "USD",
    date: "2025-03-02",
    merchant: "Merchant",
  );

  Widget wrapper(child) => MaterialApp(home: child);

  testWidgets("TransactionListTile should display transaction details", (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(wrapper(TransactionListTile(details: transaction)));

    // Assert
    expect(find.text("2025-03-02"), findsOneWidget);
    expect(find.text("Merchant"), findsOneWidget);
    expect(find.text("50.0 USD"), findsOneWidget);
  });

  testWidgets("TransactionListTile should call onTap when tapped", (
    WidgetTester tester,
  ) async {
    // Arrange
    bool tapped = false;
    await tester.pumpWidget(
      wrapper(
        TransactionListTile(details: transaction, onTap: () => tapped = true),
      ),
    );

    // Act
    await tester.tap(find.byType(TransactionListTile));
    await tester.pump();

    // Assert
    expect(tapped, isTrue);
  });
}
