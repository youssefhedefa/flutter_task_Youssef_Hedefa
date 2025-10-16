enum RequestStatusEnum {
  initial,
  loading,
  success,
  failure,
}

extension RequestStatusEnumExtension on RequestStatusEnum {
  bool get isInitial => this == RequestStatusEnum.initial;
  bool get isLoading => this == RequestStatusEnum.loading;
  bool get isSuccess => this == RequestStatusEnum.success;
  bool get isFailure => this == RequestStatusEnum.failure;
}