import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/routes/app_router.dart';
import 'package:luxe/core/routes/routes.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/core/theme/colors.dart';
import 'package:luxe/core/widgets/custom_elevated_button.dart';
import 'package:luxe/core/widgets/custom_text_field.dart';
import 'package:luxe/features/auth/presentation/widgets/logo_text.dart';
import 'package:luxe/features/auth/presentation/widgets/or_login_with_widget.dart';
import 'package:luxe/features/auth/presentation/widgets/social_login_button.dart';
import 'package:luxe/generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
              OrLoginWithWidget(text: S.of(context).or_login_with_email),
              SizedBox(height: 32.h),
              CustomTextField(
                label: S.of(context).email,
                hint: S.of(context).email_hint,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24.h),
              CustomTextField(
                label: S.of(context).password,
                hint: S.of(context).password_hint,
                controller: _passwordController,
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
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
              CustomElevatedButton(
                text: S.of(context).login,
                onPressed: () {},
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
    );
  }
}
