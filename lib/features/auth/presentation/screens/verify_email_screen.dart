import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/routes/app_router.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/core/theme/colors.dart';
import 'package:luxe/core/widgets/custom_elevated_button.dart';
import 'package:luxe/core/widgets/toastfication.dart';
import 'package:luxe/features/auth/presentation/cubits/verify_email/verify_email_cubit.dart';
import 'package:luxe/features/auth/presentation/cubits/resend_otp/resend_otp_cubit.dart';
import 'package:luxe/features/auth/presentation/widgets/auth_title.dart';
import 'package:luxe/features/auth/presentation/widgets/otp_input_field.dart';
import 'package:luxe/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String email;
  const VerifyEmailScreen({super.key, required this.email});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  String? otp;

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
                length: 6,
                onChanged: (value) {
                  setState(() {
                    otp = value;
                  });
                },
              ),
              SizedBox(height: 40.h),
              BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
                listener: (context, state) {
                  if (state is VerifyEmailSuccess) {
                    AppRouter.goBack(context);
                    showToastificationBar(
                      context: context,
                      message: S.of(context).your_email_verified_successfully,
                      title: S.of(context).success,
                      type: ToastificationType.success,
                      color: AppColors.success,
                      icon: Icons.check_circle_outline,
                    );
                  } else if (state is VerifyEmailFailure) {
                    showToastificationBar(
                      context: context,
                      message: state.errorMessage,
                      title: S.of(context).error,
                      type: ToastificationType.error,
                      color: AppColors.error,
                      icon: Icons.error_outline,
                    );
                  }
                },
                builder: (context, state) {
                  return CustomElevatedButton(
                    text: S.of(context).verify,
                    isLoading: state is VerifyEmailLoading,
                    onPressed: () {
                      if (otp != null && widget.email.isNotEmpty) {
                        context.read<VerifyEmailCubit>().verifyEmail(
                          email: widget.email,
                          otp: otp!,
                        );
                      } else if (otp == null) {
                        showToastificationBar(
                          context: context,
                          message: S.of(context).please_enter_otp,
                          title: S.of(context).error,
                          type: ToastificationType.error,
                          color: AppColors.error,
                          icon: Icons.error_outline,
                        );
                      }
                    },
                  );
                },
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
                  BlocConsumer<ResendOtpCubit, ResendOtpState>(
                    listener: (context, state) {
                      if (state is ResendOtpSuccess) {
                        showToastificationBar(
                          context: context,
                          message: S
                              .of(context)
                              .an_otp_has_been_sent_to_your_email_address,
                          title: S.of(context).success,
                          type: ToastificationType.success,
                          color: AppColors.success,
                          icon: Icons.check_circle_outline,
                        );
                      } else if (state is ResendOtpError) {
                        showToastificationBar(
                          context: context,
                          message: state.errorMessage,
                          title: S.of(context).error,
                          type: ToastificationType.error,
                          color: AppColors.error,
                          icon: Icons.error_outline,
                        );
                      }
                    },
                    builder: (context, state) {
                      return TextButton(
                        onPressed: () {
                          context.read<ResendOtpCubit>().resendOtp(
                            email: widget.email,
                          );
                        },
                        child: state is ResendOtpLoading
                            ? CupertinoActivityIndicator(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.7),
                              )
                            : Text(
                                S.of(context).resend,
                                style: AppTextStyles.medium14(context).copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                      );
                    },
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
