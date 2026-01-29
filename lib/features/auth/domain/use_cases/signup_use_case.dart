import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/core/usecase/use_case.dart';
import 'package:weather_app/features/auth/domain/repository/auth_repo.dart';

class SignUpUseCase implements UseCase<void, SignUpParams> {
  final AuthRepo authRepo;

  SignUpUseCase(this.authRepo);

  @override
  Future<Either<Failure, Unit>> call(SignUpParams params) async {
    return await authRepo.signUp(params.email, params.password);
  }
}

class SignUpParams {
  final String email;
  final String password;

  SignUpParams({required this.email, required this.password});
}
