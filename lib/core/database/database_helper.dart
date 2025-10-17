import 'dart:math';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'database_constants.dart';

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

    await deleteDatabase(path);

    return await openDatabase(
      path,
      version: DatabaseConstants.databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${DatabaseConstants.tableCategories} (
        ${DatabaseConstants.columnId} TEXT PRIMARY KEY,
        ${DatabaseConstants.columnName} TEXT NOT NULL,
        ${DatabaseConstants.columnImageUrl} TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE ${DatabaseConstants.tableProducts} (
        ${DatabaseConstants.columnId} TEXT PRIMARY KEY,
        ${DatabaseConstants.columnName} TEXT NOT NULL,
        ${DatabaseConstants.columnImagePath} TEXT NOT NULL,
        ${DatabaseConstants.columnCurrentPrice} TEXT NOT NULL,
        ${DatabaseConstants.columnPriceBeforeDiscount} TEXT NOT NULL,
        ${DatabaseConstants.columnNumberOfSales} TEXT NOT NULL,
        ${DatabaseConstants.columnIsFavorite} INTEGER NOT NULL CHECK(${DatabaseConstants.columnIsFavorite} IN (0,1)),
        ${DatabaseConstants.columnAddedToCart} INTEGER NOT NULL CHECK(${DatabaseConstants.columnAddedToCart} IN (0,1)),
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

    await db.execute('''
      CREATE TABLE ${DatabaseConstants.tablePackages} (
        ${DatabaseConstants.columnId} TEXT PRIMARY KEY,
        ${DatabaseConstants.columnName} TEXT NOT NULL,
        ${DatabaseConstants.columnPrice} TEXT,
        ${DatabaseConstants.columnNumberOfDoubles} TEXT,
        ${DatabaseConstants.columnFlag} TEXT
      )
    ''');

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

    final categories = [
      {'id': '1', 'name': 'كل العروض'},
      {'id': '2', 'name': 'ملابس'},
      {'id': '3', 'name': 'أكسسوارات'},
      {'id': '4', 'name': 'الكترونيات'},
      {'id': '5', 'name': 'موضة رجالى', 'imageUrl': 'assets/images/man.png'},
      {'id': '6', 'name': 'ساعات', 'imageUrl': 'assets/images/watch.png'},
      {'id': '7', 'name': 'موبايلات', 'imageUrl': 'assets/images/Phone.png'},
      {'id': '8', 'name': 'منتجات تجميل', 'imageUrl': 'assets/images/cosmatics.png'},
      {'id': '9', 'name': 'فلل', 'imageUrl': 'assets/images/home.png'},
    ];

    for (final cat in categories) {
      await db.insert(DatabaseConstants.tableCategories, {
        DatabaseConstants.columnId: cat['id'],
        DatabaseConstants.columnName: cat['name'],
        DatabaseConstants.columnImageUrl: cat['imageUrl'],
      });
    }

    final random = Random();
    final images = [
      'assets/images/shoes.png',
      'assets/images/sweet_shirt.png',
      'assets/images/shemize.png',
    ];
    final categoryIds = ['1', '2', '3', '4'];

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
        DatabaseConstants.columnCategoryId: categoryIds[random.nextInt(categoryIds.length)],
      });
    }

    await db.insert(DatabaseConstants.tablePackages, {
      DatabaseConstants.columnId: '1',
      DatabaseConstants.columnName: 'أساسية',
      DatabaseConstants.columnPrice: '3000',
      DatabaseConstants.columnNumberOfDoubles: '',
      DatabaseConstants.columnFlag: null,
    });

    await db.insert(DatabaseConstants.tableFeatures, {
      DatabaseConstants.columnId: '1',
      DatabaseConstants.columnFeatureName: 'صلاحية الأعلان 30 يوم',
    });

    await db.insert(DatabaseConstants.tablePackageFeatures, {
      DatabaseConstants.columnPackageId: '1',
      DatabaseConstants.columnFeatureId: '1',
    });

    await db.insert(DatabaseConstants.tablePackages, {
      DatabaseConstants.columnId: '2',
      DatabaseConstants.columnName: 'أكسترا',
      DatabaseConstants.columnPrice: '3000',
      DatabaseConstants.columnNumberOfDoubles: '18',
      DatabaseConstants.columnFlag: 'أفضل قيمة مقابل سعر',
    });

    final extraFeatures = [
      'صلاحية الأعلان 30 يوم',
      'رفع لأعلى القائمة كل 3 أيام',
      'تثبيت فى مقاول صحى',
    ];

    for (int i = 0; i < extraFeatures.length; i++) {
      final fid = (i + 2).toString();
      await db.insert(DatabaseConstants.tableFeatures, {
        DatabaseConstants.columnId: fid,
        DatabaseConstants.columnFeatureName: extraFeatures[i],
      });

      await db.insert(DatabaseConstants.tablePackageFeatures, {
        DatabaseConstants.columnPackageId: '2',
        DatabaseConstants.columnFeatureId: fid,
      });
    }

    await db.insert(DatabaseConstants.tablePackages, {
      DatabaseConstants.columnId: '3',
      DatabaseConstants.columnName: 'بلس',
      DatabaseConstants.columnPrice: '3000',
      DatabaseConstants.columnNumberOfDoubles: '18',
      DatabaseConstants.columnFlag: 'أعلى مشاهدات',
    });

    final plusFeatures = [
      'صلاحية الأعلان 30 يوم',
      'رفع لأعلى القائمة كل 3 أيام',
      'تثبيت فى مقاول صحى',
      'ظهور فى كل محافظات مصر',
      'أعلان مميز',
      'تثبيت فى مقاول صحى فى الجهراء',
    ];

    for (int i = 0; i < plusFeatures.length; i++) {
      final fid = (i + 5).toString();
      await db.insert(DatabaseConstants.tableFeatures, {
        DatabaseConstants.columnId: fid,
        DatabaseConstants.columnFeatureName: plusFeatures[i],
      });

      await db.insert(DatabaseConstants.tablePackageFeatures, {
        DatabaseConstants.columnPackageId: '3',
        DatabaseConstants.columnFeatureId: fid,
      });
    }
  }
}
