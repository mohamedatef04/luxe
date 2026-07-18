import 'package:flutter/material.dart';
import 'package:luxe/core/theme/colors.dart';
import 'package:luxe/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxe/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:luxe/features/cart/presentation/widgets/cart_summary_section.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Using a mocked list to simulate cart items
    final bool isEmpty = false;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.background,
      appBar: AppBar(
        title: Text(
          S.of(context).cart,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          if (!isEmpty)
            IconButton(
              icon: Icon(
                Icons.delete_sweep_outlined,
                color: theme.iconTheme.color,
              ),
              onPressed: () {
                // Clear cart action
              },
            ),
        ],
      ),
      body: isEmpty
          ? _buildEmptyCart(context, theme, isDark)
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 8.h, bottom: 24.h),
                    itemCount: 2, // Mocked 2 items
                    itemBuilder: (context, index) {
                      return const CartItemCard();
                    },
                  ),
                ),
                const CartSummarySection(),
              ],
            ),
    );
  }

  Widget _buildEmptyCart(BuildContext context, ThemeData theme, bool isDark) {
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 100.w,
            color: isDark
                ? AppColors.border.withOpacity(0.2)
                : AppColors.border,
          ),
          SizedBox(height: 24.h),
          Text(
            isAr ? 'عربة التسوق فارغة' : 'Your Cart is Empty',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            isAr
                ? 'يبدو أنك لم تضف أي منتجات إلى عربة التسوق الخاصة بك بعد.'
                : 'Looks like you haven\'t added any items to the cart yet.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 32.h),
          ElevatedButton(
            onPressed: () {
              // Navigate to Home or Explore
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              isAr ? 'تسوق الآن' : 'Shop Now',
              style: theme.textTheme.titleMedium?.copyWith(
                color: AppColors.textOnPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
