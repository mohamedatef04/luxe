import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/features/home/data/models/product_model.dart';
import 'package:luxe/features/home/presentation/widgets/product_details/product_details_app_bar.dart';
import 'package:luxe/features/home/presentation/widgets/product_details/product_image_section.dart';
import 'package:luxe/features/home/presentation/widgets/product_details/product_price_section.dart';
import 'package:luxe/features/home/presentation/widgets/product_details/product_description_section.dart';
import 'package:luxe/features/home/presentation/widgets/product_details/product_info_section.dart';
import 'package:luxe/features/home/presentation/widgets/product_details/product_add_to_cart_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final isArabic = locale == 'ar';

    final productName = isArabic
        ? (product.arabicName?.isNotEmpty == true
              ? product.arabicName!
              : product.englishName ?? '')
        : (product.englishName?.isNotEmpty == true
              ? product.englishName!
              : product.arabicName ?? '');

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          ProductDetailsAppBar(productName: productName),
          ProductImageSection(product: product),
          ProductPriceSection(product: product),
          ProductDescriptionSection(product: product),
          ProductInfoSection(product: product),
          // Bottom spacer so content doesn't hide behind the bar
          SliverPadding(padding: EdgeInsets.only(bottom: 20.h)),
        ],
      ),
      bottomNavigationBar: ProductAddToCartBar(product: product),
    );
  }
}
