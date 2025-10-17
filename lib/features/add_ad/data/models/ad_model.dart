import 'package:equatable/equatable.dart';
import 'package:flutter_task/core/database/database_constants.dart';

class PackageModel extends Equatable {
  final String id;
  final String title;
  final String price;
  final String numberOfDoubles;
  final String? flag;
  final List<String> features;

  const PackageModel({
    required this.id,
    required this.title,
    required this.price,
    required this.numberOfDoubles,
    this.flag,
    required this.features,
  });

  factory PackageModel.empty() {
    return const PackageModel(
      id: '',
      title: '',
      price: '',
      numberOfDoubles: '',
      flag: null,
      features: [],
    );
  }

  factory PackageModel.fromMap(Map<String, dynamic> map, {List<String>? features}) {
    return PackageModel(
      id: map[DatabaseConstants.columnId] ?? '',
      title: map[DatabaseConstants.columnName] ?? '',
      price: map[DatabaseConstants.columnPrice] ?? '',
      numberOfDoubles: map[DatabaseConstants.columnNumberOfDoubles] ?? '',
      flag: map[DatabaseConstants.columnFlag],
      features: features ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseConstants.columnId: id,
      DatabaseConstants.columnName: title,
      DatabaseConstants.columnPrice: price,
      DatabaseConstants.columnNumberOfDoubles: numberOfDoubles,
      DatabaseConstants.columnFlag: flag,
    };
  }

  @override
  List<Object?> get props => [id, title, price, numberOfDoubles, flag, features];
}
