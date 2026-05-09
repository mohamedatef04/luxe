import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/routes/app_router.dart';
import 'package:luxe/core/routes/routes.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/core/theme/colors.dart';
import 'package:luxe/core/widgets/custom_elevated_button.dart';
import 'package:luxe/core/widgets/custom_text_field.dart';
import 'package:luxe/core/widgets/toastfication.dart';
import 'package:luxe/features/auth/presentation/cubits/register/register_cubit.dart';
import 'package:luxe/features/auth/presentation/widgets/logo_text.dart';
import 'package:luxe/features/auth/presentation/widgets/or_login_with_widget.dart';
import 'package:luxe/features/auth/presentation/widgets/social_login_button.dart';
import 'package:luxe/generated/l10n.dart';
import 'package:luxe/core/utils/validator.dart';
import 'package:toastification/toastification.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const LogoText(),
                SizedBox(height: 8.h),
                Text(
                  S.of(context).create_exclusive_account,
                  style: AppTextStyles.regular14(context),
                ),
                SizedBox(height: 40.h),
                SocialLoginButton(
                  text: S.of(context).continue_with_google,
                  icon: const Icon(
                    Icons.g_mobiledata,
                    size: 32,
                    color: Colors.blue,
                  ),
                  onPressed: () {},
                ),
                SizedBox(height: 32.h),
                OrLoginWithWidget(text: S.of(context).or_register_with_email),
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: S.of(context).first_name,
                        hint: S.of(context).first_name_hint,
                        controller: _firstNameController,
                        validator: (value) =>
                            Validator.validateEmptyText(context, value),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: CustomTextField(
                        label: S.of(context).last_name,
                        hint: S.of(context).last_name_hint,
                        controller: _lastNameController,
                        validator: (value) =>
                            Validator.validateEmptyText(context, value),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                CustomTextField(
                  label: S.of(context).email,
                  hint: S.of(context).email_hint,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validator.validateEmail(context, value),
                ),
                SizedBox(height: 24.h),
                CustomTextField(
                  label: S.of(context).password,
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
                      ).colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                SizedBox(height: 40.h),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSuccess) {
                      AppRouter.navigateTo(
                        context,
                        Routes.verifyEmail,
                        arguments: _emailController.text.trim(),
                      );
                      showToastificationBar(
                        context: context,
                        message: S.of(context).account_created_successfully,
                        title: S.of(context).success,
                        type: ToastificationType.success,
                        color: Colors.green,
                        icon: Icons.check_circle_outline,
                      );
                    } else if (state is RegisterFailure) {
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
                      isLoading: state is RegisterLoading,
                      text: S.of(context).create_account,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<RegisterCubit>().register(
                            firstName: _firstNameController.text.trim(),
                            lastName: _lastNameController.text.trim(),
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).already_have_account,
                      style: AppTextStyles.regular14(context),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Or navigate to login
                      },
                      child: Text(
                        S.of(context).login,
                        style: AppTextStyles.medium14(context).copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
