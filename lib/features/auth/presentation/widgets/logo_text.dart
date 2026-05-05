import 'package:flutter/material.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/core/theme/colors.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'LUXE',
      style: AppTextStyles.bold30(context).copyWith(
        letterSpacing: 4,
        color: AppColors.primary,
      ),
    );
  }
}
