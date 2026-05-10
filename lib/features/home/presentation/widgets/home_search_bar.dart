import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/generated/l10n.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: TextField(
        decoration: InputDecoration(
          hintText: S.of(context).search_for_items,
          prefixIcon: const Icon(Icons.search),
          // Using theme defaults for border and fill color
        ),
      ),
    );
  }
}
