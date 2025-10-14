import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_string_constants.dart';
import 'package:flutter_task/features/main_navigation/presentation/view/main_navigation.dart';

class FlutterTaskApp extends StatelessWidget {
  const FlutterTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStringConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainNavigationView(),
    );
  }
}
