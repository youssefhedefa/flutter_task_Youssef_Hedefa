import 'package:flutter_task/core/database/database_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_task/core/database/database_service.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper.instance);

  sl.registerLazySingleton<DatabaseService>(
    () => DatabaseService(
      dbHelper: sl<DatabaseHelper>(),
    ),
  );
}
