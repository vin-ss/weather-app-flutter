import 'package:weather_app/features/location/domain/entity/user_location.dart';
import 'package:weather_app/features/location/domain/repository/location_repo.dart';

class SaveLocationUseCase {
  final LocationRepo locationRepo;

  SaveLocationUseCase(this.locationRepo);

  Future<void> call(UserLocation location) async {
    await locationRepo.saveLocation(location);
  }
}
