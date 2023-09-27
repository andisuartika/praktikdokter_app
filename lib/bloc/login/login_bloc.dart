import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:praktik_dokter/data/datasources/auth_remote_datasource.dart';
import 'package:praktik_dokter/data/models/response/auth_response_model.dart';
import 'package:praktik_dokter/data/models/request/login_request_model.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(_Loading());
      final result = await AuthRemoteDataSource().login(event.model);
      result.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
