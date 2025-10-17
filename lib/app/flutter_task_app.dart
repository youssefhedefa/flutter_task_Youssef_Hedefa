import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_string_constants.dart';
import 'package:flutter_task/core/routing/routing_constances.dart';
import 'package:flutter_task/core/routing/routing_manager.dart';
import 'package:flutter_task/core/themes/app_themes.dart';

class FlutterTaskApp extends StatelessWidget {
  const FlutterTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          title: AppStringConstants.appName,
          debugShowCheckedModeBanner: false,
          theme: AppThemes().lightTheme,
          darkTheme: AppThemes().darkTheme,
          themeMode: ThemeMode.light,
          initialRoute: AppRoutingConstants.mainNavigationView,
          onGenerateRoute: AppRoutingManager().onGenerateRoute,
        );
      },
    );
  }
}
