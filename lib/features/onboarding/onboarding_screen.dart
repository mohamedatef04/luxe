import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/assets.dart';
import 'package:luxe/core/routes/app_router.dart';
import 'package:luxe/core/routes/routes.dart';
import 'package:luxe/core/theme/colors.dart';
import 'package:luxe/features/onboarding/onboarding_item.dart';
import 'package:luxe/features/onboarding/onboarding_item_model.dart';
import 'package:luxe/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<OnboardingItemModel> onboardingItems = [
      OnboardingItemModel(
        image: Assets.images.onboarding_1_png,
        title: S.of(context).onboarding_1_title,
        description: S.of(context).onboarding_1_description,
        buttonText: S.of(context).next,
        onPressed: () {
          _controller.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCubic,
          );
        },
      ),
      OnboardingItemModel(
        image: Assets.images.onboarding_2_png,
        title: S.of(context).onboarding_2_title,
        description: S.of(context).onboarding_2_description,
        buttonText: S.of(context).next,
        onPressed: () {
          _controller.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCubic,
          );
        },
      ),
      OnboardingItemModel(
        image: Assets.images.onboarding_3_png,
        title: S.of(context).onboarding_3_title,
        description: S.of(context).onboarding_3_description,
        buttonText: S.of(context).get_started,
        onPressed: () {
          AppRouter.navigateAndReplace(context, Routes.login);
        },
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: onboardingItems.length,
            itemBuilder: (context, index) {
              return OnboardingItem(
                onboardingItem: onboardingItems[index],
              );
            },
          ),
          Positioned(
            bottom: 25.h,
            left: 145.w,
            child: SmoothPageIndicator(
              controller: _controller,
              count: onboardingItems.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: AppColors.primary,
                dotColor: AppColors.textLight,
                dotHeight: 10,
                dotWidth: 10,
                spacing: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
