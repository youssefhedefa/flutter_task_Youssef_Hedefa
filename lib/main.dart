import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/app/flutter_task_app.dart';
import 'package:flutter_task/app/init_services.dart';
import 'package:flutter_task/core/constants/app_string_constants.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await InitServices().init();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale(AppStringConstants.arLanguageCode),
        Locale(AppStringConstants.enLanguageCode),
      ],
      path: AppStringConstants.translationPath,
      fallbackLocale: const Locale(AppStringConstants.arLanguageCode),
      startLocale: const Locale(AppStringConstants.arLanguageCode),
      child: const FlutterTaskApp(),
    ),
  );
}
