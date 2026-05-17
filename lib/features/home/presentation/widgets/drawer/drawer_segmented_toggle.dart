import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/core/theme/colors.dart';

/// A reusable segmented toggle card with two options.
/// Used for theme (Light/Dark) and language (EN/AR) switches in the drawer.
class DrawerSegmentedToggle extends StatelessWidget {
  const DrawerSegmentedToggle({
    super.key,
    required this.icon,
    required this.label,
    required this.leftLabel,
    required this.rightLabel,
    required this.isLeftSelected,
    required this.onLeftTap,
    required this.onRightTap,
    this.leftIcon,
    this.rightIcon,
  });

  final IconData icon;
  final String label;
  final String leftLabel;
  final String rightLabel;
  final bool isLeftSelected;
  final VoidCallback onLeftTap;
  final VoidCallback onRightTap;
  final IconData? leftIcon;
  final IconData? rightIcon;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.05)
            : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.grey.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label row
          Row(
            children: [
              Icon(icon, size: 18.sp, color: AppColors.primary),
              SizedBox(width: 8.w),
              Text(label, style: AppTextStyles.semiBold14(context)),
            ],
          ),
          SizedBox(height: 12.h),

          // Toggle pills
          Container(
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.06)
                  : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.all(3.w),
            child: Row(
              children: [
                _buildOption(
                  context,
                  label: leftLabel,
                  icon: leftIcon,
                  isSelected: isLeftSelected,
                  isDark: isDark,
                  onTap: onLeftTap,
                ),
                _buildOption(
                  context,
                  label: rightLabel,
                  icon: rightIcon,
                  isSelected: !isLeftSelected,
                  isDark: isDark,
                  onTap: onRightTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(
    BuildContext context, {
    required String label,
    required bool isSelected,
    required bool isDark,
    required VoidCallback onTap,
    IconData? icon,
  }) {
    const activeColor = Colors.white;
    final inactiveColor =
        isDark ? Colors.grey.shade500 : AppColors.textSecondary;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 16.sp,
                  color: isSelected ? activeColor : inactiveColor,
                ),
                SizedBox(width: 6.w),
              ],
              Text(
                label,
                style: AppTextStyles.semiBold12(context).copyWith(
                  color: isSelected ? activeColor : inactiveColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
