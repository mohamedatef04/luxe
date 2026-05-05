import 'package:flutter/material.dart';
import 'package:luxe/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:luxe/features/auth/presentation/screens/login_screen.dart';
import 'package:luxe/features/auth/presentation/screens/password_successful_screen.dart';
import 'package:luxe/features/auth/presentation/screens/register_screen.dart';
import 'package:luxe/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:luxe/features/auth/presentation/screens/verify_code_screen.dart';
import 'package:luxe/features/auth/presentation/screens/verify_email_screen.dart';
import 'routes.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';

/// Application Router
class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _buildRoute(const SplashScreen(), settings);
      case Routes.onboarding:
        return _buildRoute(const OnboardingScreen(), settings);
      case Routes.login:
        return _buildRoute(const LoginScreen(), settings);
      case Routes.register:
        return _buildRoute(const RegisterScreen(), settings);
      case Routes.verificationCode:
        return _buildRoute(const VerifyCodeScreen(), settings);
      case Routes.verifyEmail:
        return _buildRoute(const VerifyEmailScreen(), settings);
      case Routes.forgotPassword:
        return _buildRoute(const ForgotPasswordScreen(), settings);
      case Routes.resetPassword:
        return _buildRoute(const ResetPasswordScreen(), settings);
      case Routes.successResetPassword:
        return _buildRoute(const PasswordSuccessfulScreen(), settings);

      default:
        return _buildRoute(
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
          settings,
        );
    }
  }

  static PageRouteBuilder _buildRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  static void navigateTo(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void navigateAndReplace(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  static void navigateAndRemoveUntil(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
