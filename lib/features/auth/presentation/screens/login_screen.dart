import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:luxe/core/routes/app_router.dart';
import 'package:luxe/core/routes/routes.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/core/theme/colors.dart';
import 'package:luxe/core/widgets/custom_elevated_button.dart';
import 'package:luxe/core/widgets/custom_text_field.dart';
import 'package:luxe/core/widgets/toastfication.dart';
import 'package:luxe/features/auth/presentation/cubits/cubit/google_login_cubit.dart';
import 'package:luxe/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:luxe/features/auth/presentation/widgets/logo_text.dart';
import 'package:luxe/features/auth/presentation/widgets/or_login_with_widget.dart';
import 'package:luxe/features/auth/presentation/widgets/social_login_button.dart';
import 'package:luxe/generated/l10n.dart';
import 'package:luxe/core/utils/validator.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool _obscurePassword = true;

  @override
  void dispose() {
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
                  S.of(context).welcome_back,
                  style: AppTextStyles.regular14(context),
                ),
                SizedBox(height: 40.h),
                BlocConsumer<GoogleLoginCubit, GoogleLoginState>(
                  listener: (context, state) {
                    if (state is GoogleLoginSuccess) {
                      showToastificationBar(
                        context: context,
                        message: 'Login success',
                        title: 'Success',
                        type: ToastificationType.success,
                        color: AppColors.success,
                        icon: Icons.check_circle_outline,
                      );
                    } else if (state is GoogleLoginFailure) {
                      showToastificationBar(
                        context: context,
                        message: state.errorMessage,
                        title: 'Error',
                        type: ToastificationType.error,
                        color: AppColors.error,
                        icon: Icons.error_outline,
                      );
                    }
                  },
                  builder: (context, state) {
                    return SocialLoginButton(
                      text: S.of(context).continue_with_google,
                      isLoading: state is GoogleLoginLoading,
                      icon: const Icon(
                        Icons.g_mobiledata,
                        size: 32,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        context.read<GoogleLoginCubit>().signInWithGoogle();
                      },
                    );
                  },
                ),
                SizedBox(height: 32.h),
                OrLoginWithWidget(text: S.of(context).or_login_with_email),
                SizedBox(height: 32.h),
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
                  validator: (value) =>
                      Validator.validatePassword(context, value),
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      AppRouter.navigateTo(context, Routes.forgotPassword);
                    },
                    child: Text(
                      S.of(context).forgot_password,
                      style: AppTextStyles.medium14(context).copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) async {
                    if (state is LoginSuccess) {
                      const storage = FlutterSecureStorage();
                      await storage.write(
                        key: 'access_token',
                        value: state.loginResponseModel.accessToken,
                      );
                      await storage.write(
                        key: 'refresh_token',
                        value: state.loginResponseModel.refreshToken,
                      );
                      if (!context.mounted) return;
                      AppRouter.navigateAndRemoveUntil(
                        context,
                        Routes.rootHome,
                      );
                    } else if (state is LoginFailure) {
                      showToastificationBar(
                        context: context,
                        message: state.errorMessage,
                        title: 'Error',
                        type: ToastificationType.error,
                        color: AppColors.error,
                        icon: Icons.error_outline,
                      );
                    }
                  },
                  builder: (context, state) {
                    return CustomElevatedButton(
                      text: S.of(context).login,
                      isLoading: state is LoginLoading,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          context.read<LoginCubit>().login(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                        } else {
                          autovalidateMode = AutovalidateMode.always;
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
                      S.of(context).dont_have_account,
                      style: AppTextStyles.regular14(context),
                    ),
                    TextButton(
                      onPressed: () {
                        AppRouter.navigateTo(context, Routes.register);
                      },
                      child: Text(
                        S.of(context).register,
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
