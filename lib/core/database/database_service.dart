import 'package:flutter_task/core/database/database_helper.dart';

class DatabaseService {
  final DatabaseHelper _dbHelper;

  DatabaseService({required DatabaseHelper dbHelper}) : _dbHelper = dbHelper;

  Future<List<Map<String, dynamic>>> readAll({
    required String table,
  }) async {
    final db = await _dbHelper.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> readWhere({
    required String table,
    required String where,
    required List<dynamic> whereArgs,
  }) async {
    final db = await _dbHelper.database;
    return await db.query(table, where: where, whereArgs: whereArgs);
  }

  Future<void> close() async {
    final db = await _dbHelper.database;
    await db.close();
  }
}
