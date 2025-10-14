import 'package:flutter/material.dart';
import 'package:flutter_task/features/main_navigation/presentation/view/widgets/custom_bottom_nav_bar.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
