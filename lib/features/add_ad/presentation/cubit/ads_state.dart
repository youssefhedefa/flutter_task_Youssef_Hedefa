part of 'ads_cubit.dart';

class AdsState extends Equatable {

  final RequestStatusEnum fetchPackagesStatus;
  final List<PackageModel> packages;
  final String errorMessage;

  const AdsState({
    this.fetchPackagesStatus = RequestStatusEnum.initial,
    this.packages = const [],
    this.errorMessage = '',
});

  AdsState copyWith({
    RequestStatusEnum? fetchPackagesStatus,
    List<PackageModel>? packages,
    String? errorMessage,
  }) {
    return AdsState(
      fetchPackagesStatus: fetchPackagesStatus ?? this.fetchPackagesStatus,
      packages: packages ?? this.packages,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    fetchPackagesStatus,
    packages,
    errorMessage,
  ];
}