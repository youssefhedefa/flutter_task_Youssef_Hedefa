import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'database_constants.dart';
import 'dart:math';

class DatabaseHelper {
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._internal();

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DatabaseConstants.databaseName);

    return await openDatabase(
      path,
      version: DatabaseConstants.databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // 🟦 Categories Table
    await db.execute('''
      CREATE TABLE ${DatabaseConstants.tableCategories} (
        ${DatabaseConstants.columnId} TEXT PRIMARY KEY,
        ${DatabaseConstants.columnName} TEXT NOT NULL,
        ${DatabaseConstants.columnImageUrl} TEXT
      )
    ''');

    // 🟧 Products Table (linked to Category)
    await db.execute('''
      CREATE TABLE ${DatabaseConstants.tableProducts} (
        ${DatabaseConstants.columnId} TEXT PRIMARY KEY,
        ${DatabaseConstants.columnName} TEXT NOT NULL,
        ${DatabaseConstants.columnImagePath} TEXT NOT NULL,
        ${DatabaseConstants.columnCurrentPrice} TEXT NOT NULL,
        ${DatabaseConstants.columnPriceBeforeDiscount} TEXT NOT NULL,
        ${DatabaseConstants.columnNumberOfSales} TEXT NOT NULL,
        ${DatabaseConstants.columnIsFavorite} INTEGER NOT NULL CHECK(${DatabaseConstants.columnIsFavorite} IN (0, 1)),
        ${DatabaseConstants.columnAddedToCart} INTEGER NOT NULL CHECK(${DatabaseConstants.columnAddedToCart} IN (0, 1)),
        ${DatabaseConstants.columnCategoryId} TEXT NOT NULL,
        FOREIGN KEY (${DatabaseConstants.columnCategoryId})
          REFERENCES ${DatabaseConstants.tableCategories}(${DatabaseConstants.columnId})
          ON DELETE CASCADE
      )
    ''');

    // 🟪 Features Table
    await db.execute('''
      CREATE TABLE ${DatabaseConstants.tableFeatures} (
        ${DatabaseConstants.columnId} TEXT PRIMARY KEY,
        ${DatabaseConstants.columnFeatureName} TEXT NOT NULL
      )
    ''');

    // 🟥 Packages Table
    await db.execute('''
      CREATE TABLE ${DatabaseConstants.tablePackages} (
        ${DatabaseConstants.columnId} TEXT PRIMARY KEY,
        ${DatabaseConstants.columnName} TEXT NOT NULL
      )
    ''');

    // 🟫 PackageFeatures (Join Table)
    await db.execute('''
      CREATE TABLE ${DatabaseConstants.tablePackageFeatures} (
        ${DatabaseConstants.columnPackageId} TEXT NOT NULL,
        ${DatabaseConstants.columnFeatureId} TEXT NOT NULL,
        PRIMARY KEY (${DatabaseConstants.columnPackageId}, ${DatabaseConstants.columnFeatureId}),
        FOREIGN KEY (${DatabaseConstants.columnPackageId})
          REFERENCES ${DatabaseConstants.tablePackages}(${DatabaseConstants.columnId})
          ON DELETE CASCADE,
        FOREIGN KEY (${DatabaseConstants.columnFeatureId})
          REFERENCES ${DatabaseConstants.tableFeatures}(${DatabaseConstants.columnId})
          ON DELETE CASCADE
      )
    ''');

    // 🟩 Insert Categories
    await db.insert(DatabaseConstants.tableCategories, {
      DatabaseConstants.columnId: '1',
      DatabaseConstants.columnName: 'كل العروض',
    });
    await db.insert(DatabaseConstants.tableCategories, {
      DatabaseConstants.columnId: '2',
      DatabaseConstants.columnName: 'ملابس',
    });
    await db.insert(DatabaseConstants.tableCategories, {
      DatabaseConstants.columnId: '3',
      DatabaseConstants.columnName: 'أكسسوارات',
    });
    await db.insert(DatabaseConstants.tableCategories, {
      DatabaseConstants.columnId: '4',
      DatabaseConstants.columnName: 'الكترونيات',
    });

    await db.insert(DatabaseConstants.tableCategories, {
      DatabaseConstants.columnId: '5',
      DatabaseConstants.columnName: 'موضة رجالى',
      DatabaseConstants.columnImageUrl: 'assets/images/man.png',
    });
    await db.insert(DatabaseConstants.tableCategories, {
      DatabaseConstants.columnId: '6',
      DatabaseConstants.columnName: 'ساعات',
      DatabaseConstants.columnImageUrl: 'assets/images/watch.png',
    });
    await db.insert(DatabaseConstants.tableCategories, {
      DatabaseConstants.columnId: '7',
      DatabaseConstants.columnName: 'موبايلات',
      DatabaseConstants.columnImageUrl: 'assets/images/Phone.png',
    });
    await db.insert(DatabaseConstants.tableCategories, {
      DatabaseConstants.columnId: '8',
      DatabaseConstants.columnName: 'منتجات تجميل',
      DatabaseConstants.columnImageUrl: 'assets/images/cosmatics.png',
    });
    await db.insert(DatabaseConstants.tableCategories, {
      DatabaseConstants.columnId: '9',
      DatabaseConstants.columnName: 'فلل',
      DatabaseConstants.columnImageUrl: 'assets/images/home.png',
    });

    // 🧱 Insert 20 Products
    final random = Random();
    final images = [
      'assets/images/shoes.png',
      'assets/images/sweet_shirt.png',
      'assets/images/shemize.png',
    ];
    final categories = ['1', '2', '3', '4'];

    for (int i = 1; i <= 20; i++) {
      await db.insert(DatabaseConstants.tableProducts, {
        DatabaseConstants.columnId: i.toString(),
        DatabaseConstants.columnName: 'منتج $i',
        DatabaseConstants.columnImagePath: images[random.nextInt(images.length)],
        DatabaseConstants.columnCurrentPrice: '${50 + random.nextInt(200)}',
        DatabaseConstants.columnPriceBeforeDiscount: '${100 + random.nextInt(300)}',
        DatabaseConstants.columnNumberOfSales: '${random.nextInt(500)}',
        DatabaseConstants.columnIsFavorite: random.nextBool() ? 1 : 0,
        DatabaseConstants.columnAddedToCart: random.nextBool() ? 1 : 0,
        DatabaseConstants.columnCategoryId: categories[random.nextInt(categories.length)],
      });
    }
  }
}
