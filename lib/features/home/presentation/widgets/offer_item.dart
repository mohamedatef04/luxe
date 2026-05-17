import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/features/home/data/models/offer_model.dart';

class OfferItem extends StatelessWidget {
  const OfferItem({super.key, required this.offerModel});
  final OfferModel offerModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 300.w,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: NetworkImage(
            offerModel.image ?? "assets/images/offer.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                offerModel.name ?? 'special offer',
                style: AppTextStyles.bold22(context).copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                offerModel.description ?? 'special offer description',
                style: AppTextStyles.regular14(context).copyWith(
                  color: Colors.white.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
