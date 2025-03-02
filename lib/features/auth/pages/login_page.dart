import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:simu/features/auth/providers/auth_provider.dart";
import "package:simu/features/common/widgets/toast.dart";
import "package:simu/i18n/strings.g.dart";
import "package:simu/models/user.dart";
import "package:simu/theme/color_palette.dart";
import "package:simu/theme/spacing.dart";
import "package:simu/theme/typography.dart";
import "package:simu/utils/capture.dart";

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final formKey = GlobalKey<FormState>();
  // TODO(dev): Remove when done testing.
  final emailController = TextEditingController(text: "test@example.com");
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final colors = ColorPalette.of(context);
    final typography = Typo.of(context);
    return Form(
      key: formKey,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.xxl),
              children: [
                Row(
                  spacing: Spacing.doubled,
                  children: [
                    Image.asset("assets/logo.jpg", width: 140, height: 140),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            t.title,
                            style: typography.h1.semiBold.colored(
                              colors.primary,
                            ),
                          ),
                          Text(
                            t.digitalBanking,
                            style: typography.subtitle.light.colored(
                              colors.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Spacing.large.verticalGap,
                Text(
                  t.auth.login,
                  style: typography.h1.bold.colored(colors.darkBlue),
                ),
                Spacing.large.verticalGap,
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return t.validation.fieldRequired;
                    }
                    // TODO(dev): add proper validation.
                    if (!value.contains("@") || !value.contains(".")) {
                      return t.validation.invalidEmail;
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: InputDecoration(hintText: t.auth.email),
                ),
                Spacing.doubled.verticalGap,
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return t.validation.fieldRequired;
                    }

                    return null;
                  },
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(hintText: t.auth.password),
                ),
                Spacing.doubled.verticalGap,
                ElevatedButton(
                  onPressed: () async {
                    final formValid = formKey.currentState?.validate();

                    if (formValid ?? false) {
                      final CaptureData(:data, :error) = await capture<User?>(
                        ref
                            .read(authProvider.notifier)
                            .login(email: emailController.text),
                      );

                      if (error != null) {
                        Toast.showError(context, t.errorHasOccurred);
                        return;
                      }

                      if (data != null) {
                        Toast.showSuccess(context, "${t.hello}, ${data.name}");
                        return;
                      }
                    }
                  },
                  child: Text(t.auth.login.toUpperCase()),
                ),
                Spacing.doubled.verticalGap,
                TextButton(onPressed: () {}, child: Text(t.auth.noAccountYet)),
                Spacing.doubled.verticalGap,
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: colors.grey),
                  child: Text(t.auth.registration.toUpperCase()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
