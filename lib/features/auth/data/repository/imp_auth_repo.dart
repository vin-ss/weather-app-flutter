import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/features/auth/data/sources/auth_remote_data_source.dart';
import 'package:weather_app/features/auth/domain/repository/auth_repo.dart';

class ImpAuthRepo implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  ImpAuthRepo(this.authRemoteDataSource);

  @override
  Future<Either<Failure, Unit>> signUp(String email, String password) async {
    try {
      await authRemoteDataSource.signUp(email, password);
      return const Right(unit);
    } on AuthException catch (e) {
      return Left(Failure(e.message));
    } catch (_) {
      return Left(Failure('Unexpected error'));
    }
  }

  @override
  Future<Either<Failure, Unit>> login(String email, String password) async {
    try {
      await authRemoteDataSource.login(email, password);
      return const Right(unit);
    } on AuthException catch (e) {
      return Left(Failure(e.message));
    } catch (_) {
      return Left(Failure('Unexpected error'));
    }
  }
}
