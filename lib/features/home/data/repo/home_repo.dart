import 'package:dartz/dartz.dart';
import 'package:flutter_task/core/database/database_constants.dart';
import 'package:flutter_task/core/database/database_service.dart';
import 'package:flutter_task/features/home/data/models/category_model.dart';
import 'package:flutter_task/features/home/data/models/product_model.dart';

class HomeReo {
  final DatabaseService _databaseService;

  HomeReo({required DatabaseService databaseService})
    : _databaseService = databaseService;

  Future<Either<String, List<CategoryModel>>> fetchTextCategories() async {
    try {
      final result = await _databaseService.readWhere(
        table: DatabaseConstants.tableCategories,
        where: '${DatabaseConstants.columnImageUrl} IS NULL',
        whereArgs: [],
      );
      final categories = result.map((e) => CategoryModel.fromJson(e)).toList();
      return Right(categories);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<CategoryModel>>> fetchImageCategories() async {
    try {
      final result = await _databaseService.readWhere(
        table: DatabaseConstants.tableCategories,
        where: '${DatabaseConstants.columnImageUrl} IS NOT NULL',
        whereArgs: [],
      );
      final categories = result.map((e) => CategoryModel.fromJson(e)).toList();
      return Right(categories);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> fetchProducts({
    required String? categoryId,
  }) {
    try {
      if (categoryId == null) {
        return _fetchAllProducts();
      } else {
        return _fetchProductsByCategory(categoryId);
      }
    } catch (e) {
      return Future.value(Left(e.toString()));
    }
  }

  Future<Either<String, List<ProductModel>>> _fetchAllProducts() async {
    try {
      final result = await _databaseService.readAll(
        table: DatabaseConstants.tableProducts,
      );
      final products = result.map((e) => ProductModel.fromMap(e)).toList();
      return Right(products);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> _fetchProductsByCategory(
    String categoryId,
  ) async {
    try {
      final result = await _databaseService.readWhere(
        table: DatabaseConstants.tableProducts,
        where: '${DatabaseConstants.columnCategoryId} = ?',
        whereArgs: [categoryId],
      );
      final products = result.map((e) => ProductModel.fromMap(e)).toList();
      return Right(products);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
