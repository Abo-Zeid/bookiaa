import 'package:bokiaa/feature/auth/data/models/reguest/login_params.dart';
import 'package:bokiaa/feature/auth/data/models/reguest/register_params.dart';

class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final RegisterParams params;
  RegisterEvent(this.params);
}

class LoginEvent extends AuthEvent {
  final LoginParames parames;
  LoginEvent(this.parames);
}
