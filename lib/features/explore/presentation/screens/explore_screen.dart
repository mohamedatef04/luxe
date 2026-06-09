import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/core/theme/app_text_styles.dart';
import 'package:luxe/features/explore/presentation/widgets/categories_list_view.dart';
import 'package:luxe/features/explore/presentation/widgets/products_grid_view.dart';
import 'package:luxe/generated/l10n.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).discover,
          style: AppTextStyles.bold20(context),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CategoriesListView(),
            SizedBox(height: 16.h),
            const Expanded(
              child: ProductsGridView(),
            ),
          ],
        ),
      ),
    );
  }
}
