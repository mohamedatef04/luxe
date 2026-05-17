import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/core/theme/colors.dart';
import 'package:luxe/features/home/data/models/product_model.dart';
import 'package:luxe/generated/l10n.dart';

class ProductImageSection extends StatelessWidget {
  const ProductImageSection({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final hasDiscount = (product.discountPercentage ?? 0) > 0;

    return SliverToBoxAdapter(
      child: Stack(
        children: [
          // Product Image
          Container(
            width: double.infinity,
            height: 380.h,
            decoration: BoxDecoration(
              color: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
            ),
            child: product.coverPictureUrl?.isNotEmpty == true
                ? Hero(
                    tag: 'product_${product.id}',
                    child: CachedNetworkImage(
                      imageUrl: product.coverPictureUrl!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                          strokeWidth: 2,
                        ),
                      ),
                      errorWidget: (context, url, error) => _buildPlaceholder(),
                    ),
                  )
                : _buildPlaceholder(),
          ),

          // Bottom gradient overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 120.h,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    (isDark ? AppColors.backgroundDark : AppColors.background)
                        .withValues(alpha: 1.0),
                    (isDark ? AppColors.backgroundDark : AppColors.background)
                        .withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),

          // Discount Badge
          if (hasDiscount)
            Positioned(
              top: 16.h,
              left: 16.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE74C3C), Color(0xFFFF6B6B)],
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFE74C3C).withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.local_offer_rounded,
                      color: Colors.white,
                      size: 14.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '${product.discountPercentage?.toStringAsFixed(0)}% ${S.of(context).off}',
                      style: AppTextStyles.bold12(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Action Buttons (Favorite & Share)
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Center(
      child: Icon(
        Icons.image_rounded,
        size: 80.sp,
        color: Colors.grey.shade400,
      ),
    );
  }
}
