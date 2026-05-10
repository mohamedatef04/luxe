import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/generated/l10n.dart';
import 'package:luxe/core/theme/app_text_styles.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: theme.primaryColor,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: theme.colorScheme.surface,
              child: Icon(
                Icons.person,
                size: 40.sp,
                color: theme.primaryColor,
              ),
            ),
            accountName: Text(
              'Jane Doe',
              style: AppTextStyles.bold16(
                context,
              ).copyWith(color: Colors.white),
            ),
            accountEmail: Text(
              'jane@example.com',
              style: AppTextStyles.regular14(context).copyWith(
                color: Colors.white.withValues(alpha: 0.9),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  context: context,
                  icon: Icons.local_offer_outlined,
                  title: S.of(context).offers,
                  onTap: () {
                    // Navigate to offers
                  },
                ),
                _buildDrawerItem(
                  context: context,
                  icon: isDark
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                  title: S.of(context).theme_mode,
                  onTap: () {
                    // Toggle theme logic
                  },
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.language_outlined,
                  title: S.of(context).language,
                  onTap: () {
                    // Toggle language logic
                  },
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.person_outline,
                  title: S.of(context).profile,
                  onTap: () {
                    // Navigate to profile
                  },
                ),
              ],
            ),
          ),
          const Divider(),
          _buildDrawerItem(
            context: context,
            icon: Icons.logout,
            title: S.of(context).logout,
            iconColor: theme.colorScheme.error,
            textColor: theme.colorScheme.error,
            onTap: () {
              // Logout logic
            },
          ),
          SizedBox(height: 16.h), // Safe area bottom padding
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? Theme.of(context).iconTheme.color,
      ),
      title: Text(
        title,
        style: AppTextStyles.medium16(context).copyWith(
          color: textColor ?? Theme.of(context).colorScheme.onSurface,
        ),
      ),
      onTap: onTap,
    );
  }
}
