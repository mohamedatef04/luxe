import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/theme/app_text_styles.dart';

class AuthTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? icon;

  const AuthTitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (icon != null) ...[
          icon!,
          SizedBox(height: 24.h),
        ],
        Text(
          title,
          style: AppTextStyles.bold24(context),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12.h),
        Text(
          subtitle,
          style: AppTextStyles.regular14(context).copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
