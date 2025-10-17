import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/components/enums/request_status_enum.dart';
import 'package:flutter_task/features/add_ad/data/models/ad_model.dart';
import 'package:flutter_task/features/add_ad/data/repo/ads_repo.dart';

part 'ads_state.dart';

class AdsCubit extends Cubit<AdsState> {
  final AdsRepo _adsRepo;
  AdsCubit({
    required AdsRepo adsRepo,
  }) : _adsRepo = adsRepo,
       super(const AdsState());

  Future<void> fetchPackages() async {
    log('Fetch Packages Called');
    emit(
      state.copyWith(
        fetchPackagesStatus: RequestStatusEnum.loading,
      ),
    );
    final result = await _adsRepo.fetchPackages();
    result.fold(
      (failure) {
        log('Fetch Packages Failure: $failure');
        emit(
          state.copyWith(
            fetchPackagesStatus: RequestStatusEnum.failure,
            errorMessage: failure,
          ),
        );
      },
      (packages) {
        log('Fetch Packages Success: ${packages.length} packages fetched');
        emit(
          state.copyWith(
            fetchPackagesStatus: RequestStatusEnum.success,
            packages: packages,
          ),
        );
      },
    );
  }
}
