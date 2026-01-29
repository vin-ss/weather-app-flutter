import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failure.dart';

abstract interface class AuthRepo {
  Future<Either<Failure, Unit>> signUp(String email, String password);
  Future<Either<Failure, Unit>> login(String email, String password);
}
