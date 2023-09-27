part of 'pasien_bloc.dart';

@freezed
class PasienEvent with _$PasienEvent {
  const factory PasienEvent.started() = _Started;
  const factory PasienEvent.pasien(PasienRequestModel model) = _Pasien;
  const factory PasienEvent.getPasien(int pasienId) = _GetPasien;
  const factory PasienEvent.searcPasien(String query) = _SearchPasien;
}
