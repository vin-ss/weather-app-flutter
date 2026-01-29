import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:weather_app/core/const/app_const.dart';
import 'package:weather_app/features/location/domain/entity/user_location.dart';

class LocationLocalDataSource {
  final Database database;
  LocationLocalDataSource(this.database);
  Future<void> saveLocation(UserLocation location) async {
    log('SAVE LOCATION EXCUTED SUCCESSFULLY');
    await database.insert(AppConst.tableName, {
      'id': 1,
      'country': location.country,
      'city': location.city,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<UserLocation?> getLocation() async {
    final result = await database.query(
      AppConst.tableName,
      where: 'id = ?',
      whereArgs: [1],
    );
    if (result.isEmpty) {
      return null;
    }
    return UserLocation(
      country: result.first['country'] as String,
      city: result.first['city'] as String,
    );
  }

  Future<void> deleteLocation() async {
    await database.delete(AppConst.tableName, where: 'id = ?', whereArgs: [1]);
  }
}
