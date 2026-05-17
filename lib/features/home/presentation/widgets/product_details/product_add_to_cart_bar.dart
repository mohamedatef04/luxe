import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/core/theme/colors.dart';
import 'package:luxe/features/home/data/models/product_model.dart';
import 'package:luxe/generated/l10n.dart';

class ProductAddToCartBar extends StatelessWidget {
  const ProductAddToCartBar({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isInStock = (product.stock ?? 0) > 0;
    final locale = Localizations.localeOf(context).languageCode;
    final isArabic = locale == 'ar';

    final hasDiscount = (product.discountPercentage ?? 0) > 0;
    final displayPrice = hasDiscount
        ? (product.price ?? 0) *
              (1 - (product.discountPercentage ?? 0) / 100)
        : product.price ?? 0;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: isDark ? AppColors.backgroundDark : AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.08),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
        border: Border(
          top: BorderSide(
            color: isDark
                ? Colors.white.withValues(alpha: 0.06)
                : Colors.grey.shade200,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // Price Column
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).price,
                    style: AppTextStyles.regular12(context).copyWith(
                      color: isDark
                          ? Colors.grey.shade500
                          : AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '${isArabic ? '' : 'EGP '}${displayPrice.toStringAsFixed(2)}${isArabic ? ' ج.م' : ''}',
                    style: AppTextStyles.bold20(context).copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),

            // Add to Cart Button
            Expanded(
              flex: 3,
              child: SizedBox(
                height: 52.h,
                child: ElevatedButton(
                  onPressed: isInStock ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isInStock ? AppColors.primary : Colors.grey.shade400,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor:
                        isDark ? Colors.grey.shade800 : Colors.grey.shade300,
                    disabledForegroundColor:
                        isDark ? Colors.grey.shade600 : Colors.grey.shade500,
                    elevation: isInStock ? 4 : 0,
                    shadowColor:
                        AppColors.primary.withValues(alpha: 0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isInStock
                            ? Icons.shopping_cart_outlined
                            : Icons.remove_shopping_cart_outlined,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        isInStock
                            ? S.of(context).add_to_cart
                            : S.of(context).out_of_stock,
                        style: AppTextStyles.semiBold16(context).copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
