import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/core/theme/colors.dart';
import 'package:luxe/features/explore/data/models/category_item_model.dart';

class ExploreCategoryItem extends StatelessWidget {
  final VoidCallback onTap;
  final CategoryItemModel categoryItemModel;
  final bool isSelected;

  const ExploreCategoryItem({
    super.key,

    required this.onTap,
    required this.categoryItemModel,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsetsDirectional.only(end: 12.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : (isDark ? Colors.grey.shade800 : Colors.grey.shade200),
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (categoryItemModel.imageUrl!.isNotEmpty) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  imageUrl: categoryItemModel.imageUrl!,
                  width: 24.w,
                  height: 24.w,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => SizedBox(
                    width: 24.w,
                    height: 24.w,
                    child: Padding(
                      padding: EdgeInsets.all(4.w),
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.image,
                    size: 16.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
            ],
            Text(
              categoryItemModel.name!,
              style: AppTextStyles.semiBold14(context).copyWith(
                color: isSelected
                    ? Colors.white
                    : (isDark ? Colors.white70 : Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
