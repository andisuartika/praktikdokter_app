part of 'periksa_bloc.dart';

@freezed
class PeriksaState with _$PeriksaState {
  const factory PeriksaState.initial() = _Initial;
  const factory PeriksaState.loading() = _Loading;
  const factory PeriksaState.loaded(PeriksaResponseModel data) = _Loaded;
  const factory PeriksaState.error(String message) = _Error;
}
