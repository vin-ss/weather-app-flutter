import 'package:weather_app/features/location/data/sources/location_local_data_source.dart';
import 'package:weather_app/features/location/domain/entity/user_location.dart';
import 'package:weather_app/features/location/domain/repository/location_repo.dart';

class ImpLocationRepo implements LocationRepo {
  final LocationLocalDataSource dataSource;
  ImpLocationRepo(this.dataSource);

  @override
  Future<void> saveLocation(UserLocation location) async {
    await dataSource.saveLocation(location);
  }

  @override
  Future<UserLocation?> getLocation() async {
    return await dataSource.getLocation();
  }

  @override
  Future<void> clearLocation() async {
    await dataSource.deleteLocation();
  }
}
