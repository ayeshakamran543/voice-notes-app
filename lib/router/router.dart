import 'package:flutter/material.dart';
import 'package:noteee/router/routes.dart';
import 'package:noteee/screens/change_password/change_password.dart';
import 'package:noteee/screens/edit_profile/edit_profile.dart';
import 'package:noteee/screens/forget_password/forget_password.dart';
import 'package:noteee/screens/home/home.dart';
import 'package:noteee/screens/login/login.dart';
import 'package:noteee/screens/onboarding/onboarding.dart';
import 'package:noteee/screens/register/register.dart';
import 'package:noteee/screens/settings/settings.dart';

final Map<String, Widget Function(dynamic)> appRoutes = {
  AppRoutes.onboarding: (_) => const OnboardingScreen(),
  AppRoutes.login: (_) => const LoginScreen(),
  AppRoutes.register: (_) => const RegisterScreen(),
  AppRoutes.forgetPassword: (_) => const ForgetPasswordScreen(),
  AppRoutes.home: (_) => const HomeScreen(),
  AppRoutes.setting: (_) => const SettingScreen(),
  AppRoutes.editProfile: (_) => const EditProfileScreen(),
  AppRoutes.changePassword: (_) => const ChangePasswordScreen(),
};

void navigateToScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    SlideRoute(
      settings: RouteSettings(name: ModalRoute.of(context)?.settings.name),
      child: screen,
    ),
  );
}

void navigateToFullScreen(BuildContext context, String routeName) {
  Navigator.of(context, rootNavigator: true).pushNamed(routeName);
}

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.onboarding:
      return FadeRoute(settings: settings, child: const OnboardingScreen());

    default:
      return null;
  }
}

////////////////////////////////////////////////////////////////////////Custom Routes for transitions////////////////////////////////////////////////////////////////////////
class FadeRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  FadeRoute({required this.child, required this.settings})
    : super(
        settings: settings,
        pageBuilder: (context, ani1, ani2) => child,
        transitionsBuilder: (context, ani1, ani2, child) {
          return FadeTransition(opacity: ani1, child: child);
        },
      );
}

class ScaleRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  ScaleRoute({required this.child, required this.settings})
    : super(
        settings: settings,
        pageBuilder: (context, ani1, ani2) => child,
        transitionsBuilder: (context, ani1, ani2, child) {
          final scaleAnimation = Tween(begin: 0.95, end: 1.0).animate(ani1);

          return ScaleTransition(scale: scaleAnimation, child: child);
        },
      );
}

class SlideRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  SlideRoute({required this.child, required this.settings})
    : super(
        settings: settings,
        pageBuilder: (context, ani1, ani2) => child,
        transitionsBuilder: (context, ani1, ani2, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          final offsetAnimation = ani1.drive(tween);
          final fadeAnimation = ani1.drive(CurveTween(curve: Curves.easeInOut));

          return SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(opacity: fadeAnimation, child: child),
          );
        },
        transitionDuration: const Duration(milliseconds: 600),
      );
}
