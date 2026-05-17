import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/features/home/data/models/product_model.dart';
import 'package:luxe/features/home/presentation/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:luxe/features/home/presentation/widgets/slider_product_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ItemsCarouselSlider extends StatelessWidget {
  const ItemsCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: BlocBuilder<GetProductsCubit, GetProductsState>(
        builder: (context, state) {
          if (state is GetProductsSuccess) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return CarouselSlider.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index, realIndex) {
                    return SliderProductItem(product: state.products[index]);
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
            );
          } else if (state is GetProductsFailure) {
            return Center(child: Text(state.errorMessage));
          } else if (state is GetProductsLoading) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return CarouselSlider.builder(
                  itemCount: 10,
                  itemBuilder: (context, index, realIndex) {
                    return Skeletonizer(
                      enabled: true,
                      enableSwitchAnimation: true,
                      ignoreContainers: false,
                      justifyMultiLineText: true,

                      child: SliderProductItem(
                        product: ProductModel.getEmptyProduct(),
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
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
