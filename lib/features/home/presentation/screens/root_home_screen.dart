import 'package:flutter/material.dart';
import 'package:luxe/core/widgets/custom_nav_bar.dart';
import 'package:luxe/features/home/presentation/screens/home_screen.dart';

class RootHomeScreen extends StatelessWidget {
  const RootHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeScreen(),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
