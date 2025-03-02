import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:simu/i18n/strings.g.dart";
import "package:simu/navigation.dart";
import "package:simu/theme/app_theme.dart";

void main() {
  runApp(ProviderScope(child: TranslationProvider(child: const App())));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = getRouterConfig(ref);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: lightTheme,
    );
  }
}
