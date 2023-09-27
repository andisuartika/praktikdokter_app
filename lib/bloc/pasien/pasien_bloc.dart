import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:praktik_dokter/data/datasources/pasien_remote_datasource.dart';
import 'package:praktik_dokter/data/models/request/pasien_request_model.dart';
import 'package:praktik_dokter/data/models/response/pasien_response_model.dart';

part 'pasien_event.dart';
part 'pasien_state.dart';
part 'pasien_bloc.freezed.dart';

class PasienBloc extends Bloc<PasienEvent, PasienState> {
  PasienBloc() : super(_Initial()) {
    on<_Pasien>((event, emit) async {
      emit(_Loading());
      final result = await PasienRemoteDatasource().storePasien(event.model);
      result.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });

    on<_GetPasien>((event, emit) async {
      emit(const _Loading());
      final result = await PasienRemoteDatasource().getPasien(event.pasienId);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });

    on<_SearchPasien>((event, emit) async {
      emit(const _Loading());
      final result = await PasienRemoteDatasource().searchPasien(event.query);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
