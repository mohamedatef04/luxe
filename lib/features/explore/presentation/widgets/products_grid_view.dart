import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/features/explore/presentation/widgets/explore_product_grid_item.dart';
import 'package:luxe/features/home/data/models/product_model.dart';
import 'package:luxe/features/home/presentation/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy products, to be replaced with state management later

    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsSuccess) {
          return GridView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ).copyWith(bottom: 24.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75, // Adjust for product card ratio
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return ExploreProductGridItem(
                product: state.products[index],
              );
            },
          );
        } else if (state is GetProductsFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: AppTextStyles.regular14(context),
            ),
          );
        } else {
          return GridView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ).copyWith(bottom: 24.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75, // Adjust for product card ratio
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Skeletonizer(
                enabled: true,

                child: ExploreProductGridItem(
                  product: ProductModel.getEmptyProduct(),
                ),
              );
            },
          );
        }
      },
    );
  }
}
