import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:simu/features/auth/providers/auth_provider.dart";
import "package:simu/features/dashboard/pages/dashboard_page.dart";
import "package:simu/features/auth/pages/login_page.dart";

GoRouter getRouterConfig(WidgetRef ref) {
  final user = ref.watch(authProvider);

  return GoRouter(
    routes: [
      GoRoute(
        path: "/login",
        redirect: (context, state) {
          if (user != null) {
            return "/";
          }
          return null;
        },
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: "/",
        redirect: (context, state) {
          // if (supabase.auth.currentSession.isNull) {
          //   return "/login";
          // }

          if (user == null) {
            return "/login";
          }

          return null;
        },
        builder: (context, state) => const DashboardPage(),
      ),
    ],
  );
}
