import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final String name;
  final String imagePath;
  final String currentPrice;
  final String priceBeforeDiscount;
  final String numberOfSales;
  final String categoryId;
  final bool isFavorite;
  final bool addedToCart;

  const ProductModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.currentPrice,
    required this.priceBeforeDiscount,
    required this.numberOfSales,
    required this.isFavorite,
    required this.addedToCart,
    required this.categoryId,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      imagePath: map['imagePath'] ?? '',
      currentPrice: map['currentPrice'] ?? '',
      priceBeforeDiscount: map['priceBeforeDiscount'] ?? '',
      numberOfSales: map['numberOfSales'] ?? '',
      isFavorite: map['isFavorite'] == 1,
      addedToCart: map['addedToCart'] == 1,
      categoryId: map['categoryId'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'currentPrice': currentPrice,
      'priceBeforeDiscount': priceBeforeDiscount,
      'numberOfSales': numberOfSales,
      'isFavorite': isFavorite ? 1 : 0,
      'addedToCart': addedToCart ? 1 : 0,
      'categoryId': categoryId,
    };
  }

  @override
  List<Object?> get props => [
    id,
    name,
    imagePath,
    currentPrice,
    priceBeforeDiscount,
    numberOfSales,
    isFavorite,
    addedToCart,
    categoryId,
  ];
}
