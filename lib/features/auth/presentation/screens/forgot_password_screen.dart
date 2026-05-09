import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/routes/app_router.dart';
import 'package:luxe/core/routes/routes.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/core/theme/colors.dart';
import 'package:luxe/core/widgets/custom_elevated_button.dart';
import 'package:luxe/core/widgets/custom_text_field.dart';
import 'package:luxe/core/utils/validator.dart';
import 'package:luxe/core/widgets/toastfication.dart';
import 'package:luxe/features/auth/presentation/cubits/forget_pass/forget_pass_cubit.dart';
import 'package:luxe/features/auth/presentation/widgets/auth_title.dart';
import 'package:luxe/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'LUXE',
          style: AppTextStyles.bold20(context).copyWith(
            letterSpacing: 4,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: Form(
            key: _formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AuthTitle(
                  title: S.of(context).forgot_password,
                  subtitle: S.of(context).forgot_password_desc,
                  icon: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.restore,
                      size: 40,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                CustomTextField(
                  label: S.of(context).email_address,
                  hint: S.of(context).email_hint,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                  validator: (value) => Validator.validateEmail(context, value),
                ),
                SizedBox(height: 32.h),
                BlocConsumer<ForgetPassCubit, ForgetPassState>(
                  listener: (context, state) {
                    if (state is ForgetPassSuccess) {
                      AppRouter.navigateTo(
                        context,
                        Routes.verificationCode,
                        arguments: _emailController.text.trim(),
                      );
                      showToastificationBar(
                        context: context,
                        message: S.of(context).forget_password_otp_notice,
                        title: S.of(context).success,
                        type: ToastificationType.info,
                        color: AppColors.primary,
                        icon: Icons.info_outline,
                      );
                    } else if (state is ForgetPassFailure) {
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
                      text: S.of(context).send_code,
                      isLoading: state is ForgetPassLoading,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          context.read<ForgetPassCubit>().forgetPassword(
                            email: _emailController.text.trim(),
                          );
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: 24.h),
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
      ),
    );
  }
}
