import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:praktik_dokter/data/datasources/periksa_remote_datasource.dart';
import 'package:praktik_dokter/data/models/request/periksa_request_model.dart';
import 'package:praktik_dokter/data/models/response/periksa_response_model.dart';

part 'periksa_event.dart';
part 'periksa_state.dart';
part 'periksa_bloc.freezed.dart';

class PeriksaBloc extends Bloc<PeriksaEvent, PeriksaState> {
  PeriksaBloc() : super(_Initial()) {
    on<_Periksa>((event, emit) async {
      emit(_Loading());
      final result = await PeriksaRemoteDatasource().storePeriksa(event.model);
      result.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
