import "dart:convert";

import "package:http/http.dart" as http;
import "package:riverpod/riverpod.dart";
import "package:simu/models/user.dart";

/// A [StateNotifier] that manages user authentication state.
/// It holds the current authenticated [User] or null if no user is logged in.
class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier() : super(null);

  Future<User?> login({required String email}) async {
    final url = Uri.parse(
      "https://my-json-server.typicode.com/vborbely/SimuBank/users?email=$email",
    );
    final response = await http.get(url);
    final List<dynamic> jsonData = jsonDecode(response.body);
    final users = jsonData.map((json) => User.fromJson(json)).toList();
    final user = users.firstOrNull;
    state = user;
    return user;
  }

  Future<void> logout() async {
    state = null;
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, User?>(
  (ref) => AuthNotifier(),
);
