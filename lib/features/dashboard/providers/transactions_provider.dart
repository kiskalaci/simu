import "dart:convert";

import "package:http/http.dart" as http;
import "package:riverpod/riverpod.dart";
import "package:simu/features/auth/providers/auth_provider.dart";
import "package:simu/models/transaction.dart";

/// A Riverpod provider that fetches a list of transactions for the authenticated user.
final transactionsProvider = FutureProvider((ref) async {
  final userId = ref.read(authProvider)?.id;

  if (userId == null) {
    return null;
  }

  final url = Uri.parse(
    "https://my-json-server.typicode.com/vborbely/SimuBank/transactions?userId=$userId",
  );

  final response = await http.get(url);
  final List<dynamic> jsonData = jsonDecode(response.body);
  final transactions =
      jsonData.map((json) => Transaction.fromJson(json)).toList();

  return transactions;
});
