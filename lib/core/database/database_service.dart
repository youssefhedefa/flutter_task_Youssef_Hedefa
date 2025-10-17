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

  Future<List<Map<String, dynamic>>> readWithJoin({
    required String baseTable,
    required String joinTable,
    required String joinCondition,
    List<String>? columns,
    String? where,
    List<dynamic>? whereArgs,
    String? orderBy,
  }) async {
    final db = await _dbHelper.database;
    final query = StringBuffer();

    query.write('SELECT ');
    query.write(columns != null && columns.isNotEmpty ? columns.join(', ') : '*');
    query.write(' FROM $baseTable INNER JOIN $joinTable ON $joinCondition');

    if (where != null && whereArgs != null) {
      query.write(' WHERE $where');
    }
    if (orderBy != null) {
      query.write(' ORDER BY $orderBy');
    }

    return await db.rawQuery(query.toString(), whereArgs);
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
