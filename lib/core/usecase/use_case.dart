import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failure.dart';

abstract interface class UseCase<OutType, InType> {
  Future<Either<Failure, OutType>> call(InType params);
}

class NoParams {
  const NoParams();
}
