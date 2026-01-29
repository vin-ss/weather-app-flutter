import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:weather_app/features/auth/domain/use_cases/signup_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase signUpUseCase;
  final LoginUseCase loginUseCase;

  AuthBloc({required this.signUpUseCase, required this.loginUseCase})
    : super(AuthInitial()) {
    on<AuthEventLogin>((event, emit) async {
      emit(AuthLoading());
      final result = await loginUseCase.call(
        LoginParams(email: event.email, password: event.password),
      );
      result.fold(
        (l) => emit(AuthError(message: l.message)),
        (r) => emit(AuthSuccess(message: 'User logged in successfully')),
      );
    });
    on<AuthEventRegister>((event, emit) async {
      emit(AuthLoading());
      final result = await signUpUseCase.call(
        SignUpParams(email: event.email, password: event.password),
      );
      result.fold(
        (l) => emit(AuthError(message: l.message)),
        (r) => emit(AuthSuccess(message: 'User registered successfully')),
      );
    });
  }
}
