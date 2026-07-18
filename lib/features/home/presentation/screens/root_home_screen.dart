import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxe/core/di/get_it_.dart';
import 'package:luxe/core/widgets/custom_nav_bar.dart';
import 'package:luxe/features/cart/presentation/screens/cart_screen.dart';
import 'package:luxe/features/explore/presentation/cubits/cubit/get_categories_cubit.dart';
import 'package:luxe/features/explore/presentation/screens/explore_screen.dart';
import 'package:luxe/features/home/presentation/cubits/get_offers_cubit/get_offers_cubit.dart';
import 'package:luxe/features/home/presentation/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:luxe/features/home/presentation/screens/home_screen.dart';

class RootHomeScreen extends StatefulWidget {
  const RootHomeScreen({super.key});

  @override
  State<RootHomeScreen> createState() => _RootHomeScreenState();
}

class _RootHomeScreenState extends State<RootHomeScreen> {
  final List<Widget> pages = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetProductsCubit>()..getProducts(),
        ),
        BlocProvider(
          create: (context) => getIt<GetOffersCubit>()..getOffers(),
        ),
      ],
      child: const HomeScreen(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetCategoriesCubit>()..getAllCategories(),
        ),
        BlocProvider(
          create: (context) => getIt<GetProductsCubit>()..getProducts(),
        ),
      ],
      child: const ExploreScreen(),
    ),
    const CartScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
