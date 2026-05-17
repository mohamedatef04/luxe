import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/cubits/languge_toggle_cubit.dart';
import 'package:luxe/core/cubits/theme_toggle_cubit.dart';
import 'package:luxe/generated/l10n.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/core/theme/colors.dart';
import 'package:luxe/features/home/presentation/widgets/drawer/drawer_header.dart'
    as custom_drawer;
import 'package:luxe/features/home/presentation/widgets/drawer/drawer_menu_item.dart';
import 'package:luxe/features/home/presentation/widgets/drawer/drawer_segmented_toggle.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final s = S.of(context);

    return Drawer(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.background,
      child: Column(
        children: [
          const custom_drawer.DrawerHeader(),

          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              children: [
                DrawerMenuItem(
                  icon: Icons.local_offer_outlined,
                  title: s.offers,
                  onTap: () {},
                ),
                SizedBox(height: 4.h),
                DrawerMenuItem(
                  icon: Icons.person_outline,
                  title: s.profile,
                  onTap: () {},
                ),
                SizedBox(height: 16.h),

                // Section Label
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    s.settings.toUpperCase(),
                    style: AppTextStyles.bold10(context).copyWith(
                      color: isDark
                          ? Colors.grey.shade600
                          : AppColors.textSecondary,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),

                // Theme Toggle
                DrawerSegmentedToggle(
                  icon: isDark
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded,
                  label: s.theme_mode,
                  leftLabel: s.light_mode,
                  rightLabel: s.dark_mode,
                  isLeftSelected: !isDark,
                  leftIcon: Icons.light_mode_rounded,
                  rightIcon: Icons.dark_mode_rounded,
                  onLeftTap: () {
                    final currentTheme = context.read<ThemeToggleCubit>().state;

                    if (currentTheme == ThemeData.light()) {
                      return;
                    }

                    context.read<ThemeToggleCubit>().toggleTheme(
                      ThemeData.light(),
                    );
                  },
                  onRightTap: () {
                    final currentTheme = context.read<ThemeToggleCubit>().state;

                    if (currentTheme == ThemeData.dark()) {
                      return;
                    }

                    context.read<ThemeToggleCubit>().toggleTheme(
                      ThemeData.dark(),
                    );
                  },
                ),
                SizedBox(height: 12.h),

                // Language Toggle
                DrawerSegmentedToggle(
                  icon: Icons.translate_rounded,
                  label: s.language,
                  leftLabel: 'English',
                  rightLabel: 'العربية',
                  isLeftSelected: !isArabic,
                  onLeftTap: () {
                    final currentLanguage = context
                        .read<LanguageToggleCubit>()
                        .state;
                    if (currentLanguage == const Locale('en')) {
                      return;
                    }
                    context.read<LanguageToggleCubit>().languageToggle(
                      const Locale('en'),
                    );
                  },
                  onRightTap: () {
                    final currentLanguage = context
                        .read<LanguageToggleCubit>()
                        .state;
                    if (currentLanguage == const Locale('ar')) {
                      return;
                    }
                    context.read<LanguageToggleCubit>().languageToggle(
                      const Locale('ar'),
                    );
                  },
                ),
              ],
            ),
          ),

          // Logout
          Divider(
            color: isDark
                ? Colors.white.withValues(alpha: 0.08)
                : Colors.grey.shade200,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: DrawerMenuItem(
              icon: Icons.logout_rounded,
              title: s.logout,
              iconColor: theme.colorScheme.error,
              textColor: theme.colorScheme.error,
              onTap: () {
                // Logout logic
              },
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
