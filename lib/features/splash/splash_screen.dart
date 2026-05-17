import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:luxe/assets.dart';
import 'package:luxe/core/routes/app_router.dart';
import 'package:luxe/core/routes/routes.dart';
import 'package:luxe/core/services/shared_pref_service.dart';
import 'package:luxe/core/utils/constants.dart'; // Import your constants

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _handleNavigation();
  }

  Future<void> _handleNavigation() async {
    // 1. Wait for splash animation (2 seconds)
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // 2. Check Onboarding Status (using SharedPreferences)
    final bool isVisited = await SharedPrefrenceService.getBool('is_visited');

    // 3. Check Login Status (using FlutterSecureStorage)
    const storage = FlutterSecureStorage();
    final String? token = await storage.read(key: AppConstants.accessTokenKey);

    if (!mounted) return;

    // 4. Decide where to go
    if (!isVisited) {
      AppRouter.navigateAndReplace(context, Routes.onboarding);
    } else if (token != null && token.isNotEmpty) {
      AppRouter.navigateAndReplace(context, Routes.rootHome);
    } else {
      AppRouter.navigateAndReplace(context, Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(Assets.images.logo_svg),
      ),
    );
  }
}
