import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/core/widgets/custom_elevated_button.dart';
import 'package:luxe/features/onboarding/onboarding_item_model.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.onboardingItem});
  final OnboardingItemModel onboardingItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(onboardingItem.image),
        SizedBox(
          height: 25.h,
        ),
        Text(
          onboardingItem.title,
          style: AppTextStyles.regular36(context),
        ),
        SizedBox(
          height: 10.h,
        ),

        Text(
          onboardingItem.description,
          textAlign: TextAlign.center,
          style: AppTextStyles.regular16(context),
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomElevatedButton(
          text: onboardingItem.buttonText,
          onPressed: () {},
        ),
      ],
    );
  }
}
