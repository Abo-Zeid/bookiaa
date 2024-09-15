class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccesState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String error;
  RegisterErrorState(this.error);
}

class LoginLoadingState extends AuthState {}

class LoginSuccesState extends AuthState {}

class LoginErrorState extends AuthState {
  final String error;
  LoginErrorState(this.error);
}
