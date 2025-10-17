import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/main_navigation/presentation/controllers/main_navigation_cubit/main_navigation_cubit.dart';
import 'package:flutter_task/features/main_navigation/presentation/view/widgets/custom_bottom_nav_bar.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({super.key});

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainNavigationCubit, MainNavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(child: state.views[state.currentIndex]),
          bottomNavigationBar: CustomBottomNavBar(
            state: state,
          ),
        );
      },
    );
  }
}
