part of 'periksa_bloc.dart';

@freezed
class PeriksaEvent with _$PeriksaEvent {
  const factory PeriksaEvent.started() = _Started;
  const factory PeriksaEvent.periksa(PeriksaRequestModel model) = _Periksa;
}
