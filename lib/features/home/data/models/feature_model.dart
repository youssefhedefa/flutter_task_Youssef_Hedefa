import 'package:equatable/equatable.dart';

class FeatureModel extends Equatable {
  final String id;
  final String featureName;

  const FeatureModel({required this.id, required this.featureName});

  factory FeatureModel.fromMap(Map<String, dynamic> map) {
    return FeatureModel(
      id: map['id'] ?? '',
      featureName: map['featureName'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'featureName': featureName,
    };
  }

  @override
  List<Object?> get props => [
        id,
        featureName,
  ];
}