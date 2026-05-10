import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxe/core/di/get_it_.dart';
import 'package:luxe/features/auth/presentation/cubits/cubit/google_login_cubit.dart';
import 'package:luxe/features/auth/presentation/cubits/reset_pass/reset_pass_cubit.dart';
import 'package:luxe/features/auth/presentation/cubits/verify_otp/verify_otp_cubit.dart';
import 'package:luxe/features/auth/presentation/cubits/forget_pass/forget_pass_cubit.dart';
import 'package:luxe/features/auth/presentation/cubits/verify_email/verify_email_cubit.dart';
import 'package:luxe/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:luxe/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:luxe/features/auth/presentation/cubits/resend_otp/resend_otp_cubit.dart';
import 'package:luxe/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:luxe/features/auth/presentation/screens/login_screen.dart';
import 'package:luxe/features/auth/presentation/screens/password_successful_screen.dart';
import 'package:luxe/features/auth/presentation/screens/register_screen.dart';
import 'package:luxe/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:luxe/features/auth/presentation/screens/verify_code_screen.dart';
import 'package:luxe/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:luxe/features/home/presentation/screens/home_screen.dart';
import 'package:luxe/features/home/presentation/screens/root_home_screen.dart';
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
        return _buildRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<LoginCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<GoogleLoginCubit>(),
              ),
            ],
            child: const LoginScreen(),
          ),
          settings,
        );
      case Routes.register:
        return _buildRoute(
          BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
          settings,
        );

      case Routes.verifyEmail:
        return _buildRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<VerifyEmailCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<ResendOtpCubit>(),
              ),
            ],
            child: VerifyEmailScreen(email: settings.arguments as String),
          ),
          settings,
        );
      case Routes.forgotPassword:
        return _buildRoute(
          BlocProvider(
            create: (context) => getIt<ForgetPassCubit>(),
            child: const ForgotPasswordScreen(),
          ),
          settings,
        );
      case Routes.verificationCode:
        return _buildRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<VerifyOtpCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<ResendOtpCubit>(),
              ),
            ],
            child: VerifyCodeScreen(email: settings.arguments as String),
          ),
          settings,
        );

      case Routes.resetPassword:
        final args = settings.arguments as Map<String, dynamic>;
        return _buildRoute(
          BlocProvider(
            create: (context) => getIt<ResetPassCubit>(),
            child: ResetPasswordScreen(
              email: args['email'] as String,
              otp: args['otp'] as String,
            ),
          ),
          settings,
        );
      case Routes.successResetPassword:
        return _buildRoute(const PasswordSuccessfulScreen(), settings);

      case Routes.rootHome:
        return _buildRoute(const RootHomeScreen(), settings);

      case Routes.home:
        return _buildRoute(const HomeScreen(), settings);

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
