import 'package:flutter/material.dart';
import 'package:luxe/features/home/presentation/widgets/home_app_bar.dart';
import 'package:luxe/features/home/presentation/widgets/welcome_text.dart';
import 'package:luxe/features/home/presentation/widgets/home_search_bar.dart';
import 'package:luxe/features/home/presentation/widgets/offers_banners.dart';
import 'package:luxe/features/home/presentation/widgets/items_carousel_slider.dart';
import 'package:luxe/features/home/presentation/widgets/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      drawer: HomeDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WelcomeText(),
          HomeSearchBar(),
          OffersBanners(),
          Expanded(child: ItemsCarouselSlider()),
        ],
      ),
    );
  }
}
