import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/theme/colors.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image Placeholder
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: isDark ? AppColors.backgroundDark : AppColors.background,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 40.w,
              color: theme.colorScheme.primary.withOpacity(0.5),
            ),
          ),
          SizedBox(width: 16.w),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Localizations.localeOf(context).languageCode == 'ar'
                      ? 'حقيبة فاخرة'
                      : 'Luxury Bag',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  '\$120.00',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),

                // Quantity Selector
                Row(
                  children: [
                    _buildQuantityBtn(context, Icons.remove, () {}, isDark),
                    SizedBox(width: 12.w),
                    Text(
                      '1',
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(width: 12.w),
                    _buildQuantityBtn(context, Icons.add, () {}, isDark),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_outline,
                        color: AppColors.error,
                        size: 24.w,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityBtn(
    BuildContext context,
    IconData icon,
    VoidCallback onTap,
    bool isDark,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: isDark
                ? AppColors.border.withOpacity(0.2)
                : AppColors.border,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(
          icon,
          size: 16.w,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
