part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class AuthEventRegister extends AuthEvent {
  final String email;
  final String password;
  AuthEventRegister({required this.email, required this.password});
}

final class AuthEventLogin extends AuthEvent {
  final String email;
  final String password;
  AuthEventLogin({required this.email, required this.password});
}
