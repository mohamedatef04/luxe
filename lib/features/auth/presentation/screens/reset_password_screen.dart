import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/routes/app_router.dart';
import 'package:luxe/core/routes/routes.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/core/widgets/custom_elevated_button.dart';
import 'package:luxe/core/widgets/custom_text_field.dart';
import 'package:luxe/core/utils/validator.dart';
import 'package:luxe/core/widgets/toastfication.dart';
import 'package:luxe/features/auth/presentation/cubits/reset_pass/reset_pass_cubit.dart';
import 'package:luxe/features/auth/presentation/widgets/auth_title.dart';
import 'package:luxe/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.otp,
  });
  final String email;
  final String otp;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AuthTitle(
                  title: S.of(context).new_password,
                  subtitle: S.of(context).new_password_desc,
                ),
                SizedBox(height: 40.h),
                CustomTextField(
                  label: S.of(context).new_password,
                  hint: S.of(context).password_hint,
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  validator: (value) =>
                      Validator.validatePassword(context, value),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.5),
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.of(context).must_be_at_least_8_chars,
                    style: AppTextStyles.regular12(context).copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                CustomTextField(
                  label: S.of(context).confirm_password,
                  hint: S.of(context).password_hint,
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  validator: (value) => Validator.validateConfirmPassword(
                    context,
                    value,
                    _passwordController.text,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                ),
                SizedBox(height: 40.h),
                BlocConsumer<ResetPassCubit, ResetPassState>(
                  listener: (context, state) {
                    if (state is ResetPassSuccess) {
                      AppRouter.navigateTo(
                        context,
                        Routes.successResetPassword,
                      );
                    } else if (state is ResetPassError) {
                      showToastificationBar(
                        context: context,
                        message: state.errorMessage,
                        title: S.of(context).error,
                        type: ToastificationType.error,
                        color: Colors.red,
                        icon: Icons.error_outline,
                      );
                    }
                  },
                  builder: (context, state) {
                    return CustomElevatedButton(
                      text: S.of(context).reset_password,
                      isLoading: state is ResetPassLoading,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ResetPassCubit>().resetPassword(
                            email: widget.email,
                            newPassword: _passwordController.text.trim(),
                            otp: widget.otp,
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
