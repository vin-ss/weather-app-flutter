import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/core/usecase/use_case.dart';
import 'package:weather_app/features/auth/domain/repository/auth_repo.dart';

class LoginUseCase implements UseCase<Unit, LoginParams> {
  final AuthRepo authRepo;

  LoginUseCase(this.authRepo);

  @override
  Future<Either<Failure, Unit>> call(LoginParams params) async {
    return await authRepo.login(params.email, params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
