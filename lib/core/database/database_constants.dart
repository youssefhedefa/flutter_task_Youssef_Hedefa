abstract class DatabaseConstants {
  // Database Info
  static const String databaseName = 'app_database.db';
  static const int databaseVersion = 3;

  // Table Names
  static const String tableCategories = 'categories';
  static const String tableProducts = 'products';
  static const String tableFeatures = 'features';
  static const String tablePackages = 'packages';
  static const String tablePackageFeatures = 'package_features';

  // Common Columns
  static const String columnId = 'id';
  static const String columnName = 'name';

  // Category Columns
  static const String columnImageUrl = 'imageUrl';

  // Product Columns
  static const String columnImagePath = 'imagePath';
  static const String columnCurrentPrice = 'currentPrice';
  static const String columnPriceBeforeDiscount = 'priceBeforeDiscount';
  static const String columnNumberOfSales = 'numberOfSales';
  static const String columnIsFavorite = 'isFavorite';
  static const String columnAddedToCart = 'addedToCart';
  static const String columnCategoryId = 'categoryId';

  // Feature Columns
  static const String columnFeatureName = 'featureName';

  // Package Columns
  static const String columnPrice = 'price';
  static const String columnNumberOfDoubles = 'numberOfDoubles';
  static const String columnFlag = 'flag';

  // PackageFeatures Join Table Columns
  static const String columnPackageId = 'packageId';
  static const String columnFeatureId = 'featureId';
}
