import 'package:weather_app/features/location/domain/entity/user_location.dart';
import 'package:weather_app/features/location/domain/repository/location_repo.dart';

class GetLocationUseCase {
  final LocationRepo locationRepo;

  GetLocationUseCase(this.locationRepo);

  Future<UserLocation?> call() async {
    return await locationRepo.getLocation();
  }
}
