import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/features/home/data/models/offer_model.dart';
import 'package:luxe/features/home/presentation/cubits/get_offers_cubit/get_offers_cubit.dart';
import 'package:luxe/features/home/presentation/widgets/offer_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OffersBanners extends StatelessWidget {
  const OffersBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOffersCubit, GetOffersState>(
      builder: (context, state) {
        if (state is GetOffersLoaded) {
          return SizedBox(
            height: 200.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.offers.length,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              itemBuilder: (context, index) =>
                  OfferItem(offerModel: state.offers[index]),
            ),
          );
        } else if (state is GetOffersError) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {}
        return SizedBox(
          height: 150.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            itemBuilder: (context, index) => Skeletonizer(
              enabled: true,

              child: OfferItem(offerModel: OfferModel.getEmptyProduct()),
            ),
          ),
        );
      },
    );
  }
}
