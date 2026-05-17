import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/core/theme/colors.dart';
import 'package:luxe/features/home/data/models/product_model.dart';
import 'package:luxe/generated/l10n.dart';

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final s = S.of(context);

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Title
            Text(
              s.details,
              style: AppTextStyles.bold18(context).copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 12.h),

            // Info Cards Container
            Container(
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
                children: [
                  // Stock Status
                  if (product.stock != null)
                    _buildInfoRow(
                      context,
                      icon: Icons.inventory_2_outlined,
                      label: s.stock,
                      value: (product.stock ?? 0) > 0
                          ? s.in_stock
                          : s.out_of_stock,
                      valueColor: (product.stock ?? 0) > 0
                          ? AppColors.success
                          : AppColors.error,
                      subtitle: (product.stock ?? 0) > 0
                          ? '${product.stock} ${_getItemsLabel(context)}'
                          : null,
                      isDark: isDark,
                      showDivider: true,
                    ),

                  // Category
                  if (product.category?.isNotEmpty == true)
                    _buildInfoRow(
                      context,
                      icon: Icons.category_outlined,
                      label: s.category,
                      value: product.category!,
                      isDark: isDark,
                      showDivider: true,
                    ),

                  // Weight
                  if (product.weight != null && product.weight! > 0)
                    _buildInfoRow(
                      context,
                      icon: Icons.scale_outlined,
                      label: s.weight,
                      value: '${product.weight} kg',
                      isDark: isDark,
                      showDivider: true,
                    ),

                  // Color
                  if (product.color?.isNotEmpty == true)
                    _buildInfoRow(
                      context,
                      icon: Icons.palette_outlined,
                      label: s.color,
                      value: product.color!,
                      isDark: isDark,
                      showDivider: true,
                      trailing: _buildColorDot(product.color!),
                    ),

                  // Product Code
                  if (product.productCode?.isNotEmpty == true)
                    _buildInfoRow(
                      context,
                      icon: Icons.qr_code_rounded,
                      label: s.product_code,
                      value: product.productCode!,
                      isDark: isDark,
                      showDivider: false,
                    ),
                ],
              ),
            ),

            // Categories Tags
            if (product.categories?.isNotEmpty == true) ...[
              SizedBox(height: 16.h),
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: product.categories!
                    .map((cat) => _buildCategoryChip(context, cat, isDark))
                    .toList(),
              ),
            ],

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  String _getItemsLabel(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'ar' ? 'قطعة متاحة' : 'items available';
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required bool isDark,
    required bool showDivider,
    Color? valueColor,
    String? subtitle,
    Widget? trailing,
  }) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(icon, size: 18.sp, color: AppColors.primary),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: AppTextStyles.regular12(context).copyWith(
                        color: isDark
                            ? Colors.grey.shade500
                            : AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      value,
                      style: AppTextStyles.semiBold14(context).copyWith(
                        color: valueColor ?? Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    if (subtitle != null) ...[
                      SizedBox(height: 2.h),
                      Text(
                        subtitle,
                        style: AppTextStyles.regular10(context).copyWith(
                          color: isDark
                              ? Colors.grey.shade600
                              : AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null) trailing,
            ],
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            indent: 56.w,
            color: isDark
                ? Colors.white.withValues(alpha: 0.06)
                : Colors.grey.shade200,
          ),
      ],
    );
  }

  Widget _buildColorDot(String colorName) {
    final colorMap = {
      'red': Colors.red,
      'blue': Colors.blue,
      'green': Colors.green,
      'black': Colors.black,
      'white': Colors.white,
      'yellow': Colors.yellow,
      'orange': Colors.orange,
      'purple': Colors.purple,
      'pink': Colors.pink,
      'brown': Colors.brown,
      'grey': Colors.grey,
      'gray': Colors.grey,
      'navy': const Color(0xFF001F3F),
      'beige': const Color(0xFFF5F5DC),
      'gold': const Color(0xFFFFD700),
      'silver': const Color(0xFFC0C0C0),
    };

    final color = colorMap[colorName.toLowerCase()];
    if (color == null) return const SizedBox.shrink();

    return Container(
      width: 24.w,
      height: 24.w,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(
      BuildContext context, String category, bool isDark) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: isDark ? 0.15 : 0.08),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.2),
        ),
      ),
      child: Text(
        category,
        style: AppTextStyles.medium12(context).copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
