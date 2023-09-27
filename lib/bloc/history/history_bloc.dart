import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:praktik_dokter/data/datasources/history_remote_datasource.dart';
import 'package:praktik_dokter/data/models/response/history_response_model.dart';

part 'history_event.dart';
part 'history_state.dart';
part 'history_bloc.freezed.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(_Initial()) {
    on<_GetAll>((event, emit) async {
      emit(const _Loading());
      final result = await HistoryRemoteDatasource().getHistory();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });

    on<_GetHistory>((event, emit) async {
      emit(const _Loading());
      final result =
          await HistoryRemoteDatasource().getHistoryPasien(event.pasienId);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
