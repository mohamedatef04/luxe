import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/generated/l10n.dart';
import 'package:luxe/core/theme/app_text_styles.dart';

class ItemsCarouselSlider extends StatelessWidget {
  const ItemsCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return CarouselSlider.builder(
            itemCount: 5, // Placeholder count
            itemBuilder: (context, index, realIndex) {
              return Container(
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
                    Container(
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.grey.shade800
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.image,
                          size: 50.sp,
                          color: Colors.grey,
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
                              '${S.of(context).item} ${index + 1}',
                              style: AppTextStyles.bold16(context).copyWith(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '\$${(index + 1) * 20}.00',
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
              );
            },
            options: CarouselOptions(
              height: constraints.maxHeight,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.6,
              initialPage: 0,
            ),
          );
        },
      ),
    );
  }
}
