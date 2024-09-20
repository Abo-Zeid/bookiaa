import 'package:bokiaa/core/services/local_storage.dart';
import 'package:bokiaa/feature/auth/data/repoo/auth_repoo.dart';
import 'package:bokiaa/feature/auth/presentation/bloc/auth_event.dart';
import 'package:bokiaa/feature/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>(register);
    on<LoginEvent>(login);
  }
  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    await AuthRepoo.register(event.params).then((value) {
      if (value != null) {
        AppLocalStorage.cacheData(
            key: AppLocalStorage.token, value: value.data?.token);
        emit(RegisterSuccesState());
      } else {
        emit(RegisterErrorState("Something went  Occurred"));
      }
    });
  }

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    await AuthRepoo.login(event.parames).then((value) {
      if (value != null) {
        AppLocalStorage.cacheData(
            key: AppLocalStorage.token, value: value.data?.token);
        emit(LoginSuccesState());
      } else {
        emit(LoginErrorState("Something went Occurred"));
      }
    });
  }
}
