import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/generated/l10n.dart';
import 'package:luxe/core/theme/app_text_styles.dart';

class OffersBanners extends StatelessWidget {
  const OffersBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).special_offer,
                style: AppTextStyles.bold22(context).copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                S.of(context).special_offer_desc,
                style: AppTextStyles.regular14(context).copyWith(
                  color: Colors.white.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
          PositionedDirectional(
            end: -20.w,
            bottom: -20.h,
            child: Icon(
              Icons.local_offer,
              size: 120.sp,
              color: Colors.white.withValues(alpha: 0.2),
            ),
          ),
        ],
      ),
    );
  }
}
