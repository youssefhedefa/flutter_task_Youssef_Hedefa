import 'package:dartz/dartz.dart';
import 'package:flutter_task/core/database/database_constants.dart';
import 'package:flutter_task/core/database/database_service.dart';
import 'package:flutter_task/features/add_ad/data/models/ad_model.dart';

class AdsRepo {
  final DatabaseService _databaseService;

  AdsRepo({required DatabaseService databaseService})
    : _databaseService = databaseService;

  Future<Either<String, List<PackageModel>>> fetchPackages() async {
    try {
      final packagesData = await _databaseService.readAll(
        table: DatabaseConstants.tablePackages,
      );

      List<PackageModel> packages = [];

      for (final pkg in packagesData) {
        final featureRows = await _databaseService.readWithJoin(
          baseTable: DatabaseConstants.tableFeatures,
          joinTable: DatabaseConstants.tablePackageFeatures,
          joinCondition:
          'features.${DatabaseConstants.columnId} = package_features.${DatabaseConstants.columnFeatureId}',
          columns: ['features.${DatabaseConstants.columnFeatureName}'],
          where:
          'package_features.${DatabaseConstants.columnPackageId} = ?',
          whereArgs: [pkg[DatabaseConstants.columnId]],
        );

        final features = featureRows
            .map((f) => f[DatabaseConstants.columnFeatureName] as String)
            .toList();

        packages.add(PackageModel.fromMap(pkg, features: features));
      }

      return Right(packages);
    } catch (e) {
      return Left('Failed to fetch packages: $e');
    }
  }


}
