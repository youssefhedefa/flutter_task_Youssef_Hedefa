import 'package:equatable/equatable.dart';

class PackageModel extends Equatable {
  final String id;
  final String name;
  final List<String> featuresId;

  const PackageModel({required this.id, required this.name, required this.featuresId});

  factory PackageModel.fromMap(Map<String, dynamic> map) {
    return PackageModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      featuresId: List<String>.from(map['featuresId'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'featuresId': featuresId,
    };
  }

  @override
  List<Object?> get props => [
    id,
    name,
    featuresId,
  ];
}
