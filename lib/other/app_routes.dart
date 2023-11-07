import 'package:flutter/material.dart';
import 'package:kino24/main.dart';
import 'package:kino24/pages/authorization/authorization.dart';
import 'package:kino24/pages/base_screen.dart';
import 'package:kino24/pages/registration/registration.dart';
import 'package:kino24/pages/screen_layout/screen_layout.dart';
import 'package:kino24/pages/auth_reg/auth_reg.dart';
import 'package:kino24/pages/onboard/onboard.dart';
import 'package:go_router/go_router.dart';
import 'app_export.dart';

class AppRoutes {
  static const root = '/';
  static const screensaver = '/screensaver';
  static const authReg = '/auth_reg';
  static const authorization = '/authorization';
  static const registration = '/registration';
  static const homepage = '/homepage';
  static const profileUser = '/profile_user';
  static const onboard = '/onboard';

  static final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: root,
        builder: (context, state) {
          if (supabase.auth.currentUser != null) {
            return const BaseScreen();
          } else {
            return const Onboard();
          }
        },
      ),
      GoRoute(
        path: onboard,
        builder: (context, state) => const Onboard(),
      ),
      GoRoute(
        path: authReg,
        builder: (context, state) => const AuthReg(),
      ),
      GoRoute(
        path: authorization,
        builder: (context, state) => const Authorization(),
      ),
      GoRoute(
        path: registration,
        builder: (context, state) => const Registration(),
      ),
      GoRoute(
        path: homepage,
        builder: (context, state) => const BaseScreen(),
      ),
    ],
    initialLocation: root,
    errorBuilder: (context, state) => const ScreenLayout(
        child: Center(
      child: Text("Страница не найдена!"),
    )),
  );

  static GoRouter get router => _router;
}
