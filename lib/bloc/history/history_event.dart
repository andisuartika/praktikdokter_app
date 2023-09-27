part of 'history_bloc.dart';

@freezed
class HistoryEvent with _$HistoryEvent {
  const factory HistoryEvent.started() = _Started;
  const factory HistoryEvent.getAll() = _GetAll;
  const factory HistoryEvent.getHistory(int pasienId) = _GetHistory;
}
