import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:simu/features/auth/providers/auth_provider.dart";
import "package:simu/i18n/strings.g.dart";

class SettingsTab extends ConsumerWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
    children: [
      ElevatedButton(
        onPressed: () {
          ref.read(authProvider.notifier).logout();
        },
        child: Text(t.auth.logout),
      ),
    ],
  );
}
