import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/routes/app_router.dart';
import 'package:luxe/core/routes/routes.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/core/theme/colors.dart';
import 'package:luxe/features/home/data/models/product_model.dart';

class SliderProductItem extends StatelessWidget {
  const SliderProductItem({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final locale = Localizations.localeOf(context).languageCode;
    final isArabic = locale == 'ar';

    final name = isArabic
        ? (product.arabicName?.isNotEmpty == true
              ? product.arabicName
              : product.englishName)
        : (product.englishName?.isNotEmpty == true
              ? product.englishName
              : product.arabicName);

    return GestureDetector(
      onTap: () => AppRouter.navigateTo(
        context,
        Routes.productDetails,
        arguments: product,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: isDark ? 0.3 : 0.05,
              ),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: product.coverPictureUrl?.isNotEmpty == true
                  ? CachedNetworkImage(
                      imageUrl: product.coverPictureUrl!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: (context, url) => Container(
                        color: isDark
                            ? Colors.grey.shade800
                            : Colors.grey.shade200,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: isDark
                            ? Colors.grey.shade800
                            : Colors.grey.shade200,
                        child: Center(
                          child: Icon(
                            Icons.image,
                            size: 50.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      color: isDark
                          ? Colors.grey.shade800
                          : Colors.grey.shade200,
                      child: Center(
                        child: Icon(
                          Icons.image,
                          size: 50.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.7),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bold16(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'EGP ${product.price?.toStringAsFixed(2) ?? '0.00'}',
                      style: AppTextStyles.semiBold14(context).copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
