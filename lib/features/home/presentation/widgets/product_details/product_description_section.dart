import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/core/theme/colors.dart';
import 'package:luxe/features/home/data/models/product_model.dart';
import 'package:luxe/generated/l10n.dart';

class ProductDescriptionSection extends StatefulWidget {
  const ProductDescriptionSection({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDescriptionSection> createState() =>
      _ProductDescriptionSectionState();
}

class _ProductDescriptionSectionState extends State<ProductDescriptionSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final locale = Localizations.localeOf(context).languageCode;
    final isArabic = locale == 'ar';

    final description = isArabic
        ? (widget.product.arabicDescription?.isNotEmpty == true
              ? widget.product.arabicDescription
              : widget.product.englishDescription)
        : (widget.product.englishDescription?.isNotEmpty == true
              ? widget.product.englishDescription
              : widget.product.arabicDescription);

    if (description == null || description.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Title
            Text(
              S.of(context).description,
              style: AppTextStyles.bold18(context).copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 8.h),

            // Description Text
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: Text(
                description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.regular14(context).copyWith(
                  color: isDark
                      ? Colors.grey.shade400
                      : AppColors.textSecondary,
                  height: 1.6,
                ),
              ),
              secondChild: Text(
                description,
                style: AppTextStyles.regular14(context).copyWith(
                  color: isDark
                      ? Colors.grey.shade400
                      : AppColors.textSecondary,
                  height: 1.6,
                ),
              ),
            ),

            // Read More / Less
            if (description.length > 120)
              GestureDetector(
                onTap: () => setState(() => _isExpanded = !_isExpanded),
                child: Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Text(
                    _isExpanded
                        ? (isArabic ? 'عرض أقل' : 'Show Less')
                        : (isArabic ? 'عرض المزيد' : 'Read More'),
                    style: AppTextStyles.semiBold12(context).copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
