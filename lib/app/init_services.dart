import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/core/di/injection_container.dart';

class InitServices {
  InitServices._internal();

  static final InitServices _instance = InitServices._internal();

  factory InitServices() {
    return _instance;
  }

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    initServiceLocator();
    makeStatusBarTransparent();
  }

  void makeStatusBarTransparent() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}
