import 'package:weather_app/features/location/domain/entity/user_location.dart';

abstract interface class LocationRepo {
  Future<void> saveLocation(UserLocation location);
  Future<UserLocation?> getLocation();
  Future<void> clearLocation();
}
