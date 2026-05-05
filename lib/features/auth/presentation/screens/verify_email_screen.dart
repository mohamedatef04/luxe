import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/core/theme/colors.dart';
import 'package:luxe/core/widgets/custom_elevated_button.dart';
import 'package:luxe/features/auth/presentation/widgets/auth_title.dart';
import 'package:luxe/features/auth/presentation/widgets/otp_input_field.dart';
import 'package:luxe/generated/l10n.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AuthTitle(
                title: S.of(context).verify_identity,
                subtitle: S.of(context).verify_identity_desc,
                icon: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.security,
                    size: 40,
                    color: AppColors.primary,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              OtpInputField(
                length: 4,
                onChanged: (value) {},
              ),
              SizedBox(height: 40.h),
              CustomElevatedButton(
                text: S.of(context).verify,
                onPressed: () {},
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).didnt_receive_code,
                    style: AppTextStyles.regular14(context).copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      S.of(context).resend,
                      style: AppTextStyles.medium14(context).copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              TextButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, size: 16),
                label: Text(
                  S.of(context).back_to_login,
                  style: AppTextStyles.medium14(context),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
