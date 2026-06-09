import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/features/explore/data/models/category_item_model.dart';
import 'package:luxe/features/explore/presentation/cubits/cubit/get_categories_cubit.dart';
import 'package:luxe/features/explore/presentation/widgets/explore_category_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      builder: (context, state) {
        if (state is GetCategoriesSuccess) {
          return SizedBox(
            height: 60.h,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return ExploreCategoryItem(
                  categoryItemModel: state.categories[index],

                  isSelected: _selectedCategoryIndex == index,
                  onTap: () {
                    setState(() {
                      _selectedCategoryIndex = index;
                    });
                  },
                );
              },
            ),
          );
        } else if (state is GetCategoriesFailure) {
          return SizedBox(
            height: 60.h,
            child: Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        } else {
          return SizedBox(
            height: 60.h,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Skeletonizer(
                  enabled: true,
                  child: ExploreCategoryItem(
                    categoryItemModel: CategoryItemModel.getEmptyCategoryItem(),

                    isSelected: _selectedCategoryIndex == index,
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = index;
                      });
                    },
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
