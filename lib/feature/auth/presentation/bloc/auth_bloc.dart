import 'dart:developer';

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
        emit(RegisterSuccesState());
      } else {
        log("Registration failed: ${event.params}");
        emit(RegisterErrorState("Something went  Occurred"));
      }
    });
  }

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    await AuthRepoo.login(event.parames).then((value) {
      if (value != null) {
        emit(LoginLoadingState());
      } else {
        log("Login failed: ${event.parames}");
        emit(LoginErrorState("Something went Occurred"));
      }
    });
  }
}
