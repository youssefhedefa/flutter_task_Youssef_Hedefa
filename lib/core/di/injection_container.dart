import 'package:flutter_task/core/database/database_helper.dart';
import 'package:flutter_task/features/add_ad/data/repo/ads_repo.dart';
import 'package:flutter_task/features/add_ad/presentation/cubit/ads_cubit.dart';
import 'package:flutter_task/features/home/data/repo/home_repo.dart';
import 'package:flutter_task/features/home/presentation/cubit/home_cubit.dart';
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

  sl.registerLazySingleton<HomeReo>(
    () => HomeReo(
      databaseService: sl<DatabaseService>(),
    ),
  );

  sl.registerFactory<HomeCubit>(
    () => HomeCubit(
      homeRepo: sl<HomeReo>(),
    ),
  );

  sl.registerLazySingleton<AdsRepo>(
    () => AdsRepo(
      databaseService: sl<DatabaseService>(),
    ),
  );

  sl.registerFactory<AdsCubit>(
    () => AdsCubit(
      adsRepo: sl<AdsRepo>(),
    ),
  );
}
