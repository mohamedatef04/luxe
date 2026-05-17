import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/core/theme/colors.dart';
import 'package:luxe/features/home/data/models/product_model.dart';
import 'package:luxe/generated/l10n.dart';

class ProductPriceSection extends StatelessWidget {
  const ProductPriceSection({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final locale = Localizations.localeOf(context).languageCode;
    final isArabic = locale == 'ar';
    final hasDiscount = (product.discountPercentage ?? 0) > 0;

    final name = isArabic
        ? (product.arabicName?.isNotEmpty == true
              ? product.arabicName
              : product.englishName)
        : (product.englishName?.isNotEmpty == true
              ? product.englishName
              : product.arabicName);

    final discountedPrice = hasDiscount
        ? (product.price ?? 0) *
              (1 - (product.discountPercentage ?? 0) / 100)
        : product.price ?? 0;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Name
            Text(
              name ?? '',
              style: AppTextStyles.bold24(context),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 12.h),

            // Price Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Current Price
                Text(
                  '${isArabic ? '' : 'EGP '}${discountedPrice.toStringAsFixed(2)}${isArabic ? ' ج.م' : ''}',
                  style: AppTextStyles.bold26(context).copyWith(
                    color: AppColors.primary,
                  ),
                ),
                if (hasDiscount) ...[
                  SizedBox(width: 10.w),
                  // Original Price
                  Text(
                    '${isArabic ? '' : 'EGP '}${product.price?.toStringAsFixed(2) ?? '0.00'}${isArabic ? ' ج.م' : ''}',
                    style: AppTextStyles.regular16(context).copyWith(
                      color: isDark
                          ? Colors.grey.shade500
                          : Colors.grey.shade600,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: isDark
                          ? Colors.grey.shade500
                          : Colors.grey.shade600,
                    ),
                  ),
                ],
              ],
            ),
            SizedBox(height: 12.h),

            // Rating & Reviews Row
            Row(
              children: [
                // Rating Stars
                ...List.generate(5, (index) {
                  final rating = product.rating?.toDouble() ?? 0;
                  if (index < rating.floor()) {
                    return Icon(Icons.star_rounded,
                        color: const Color(0xFFFFB800), size: 20.sp);
                  } else if (index < rating) {
                    return Icon(Icons.star_half_rounded,
                        color: const Color(0xFFFFB800), size: 20.sp);
                  } else {
                    return Icon(Icons.star_outline_rounded,
                        color: Colors.grey.shade400, size: 20.sp);
                  }
                }),
                SizedBox(width: 8.w),
                Text(
                  '${product.rating?.toStringAsFixed(1) ?? '0.0'}',
                  style: AppTextStyles.semiBold14(context).copyWith(
                    color: isDark ? Colors.grey.shade300 : AppColors.textPrimary,
                  ),
                ),
                SizedBox(width: 6.w),
                Text(
                  '(${product.reviewsCount ?? 0} ${S.of(context).reviews})',
                  style: AppTextStyles.regular12(context).copyWith(
                    color: isDark
                        ? Colors.grey.shade500
                        : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
