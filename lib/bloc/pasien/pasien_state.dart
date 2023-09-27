part of 'pasien_bloc.dart';

@freezed
class PasienState with _$PasienState {
  const factory PasienState.initial() = _Initial;
  const factory PasienState.loading() = _Loading;
  const factory PasienState.loaded(PasienResponseModel data) = _Loaded;
  const factory PasienState.error(String message) = _Error;
}
