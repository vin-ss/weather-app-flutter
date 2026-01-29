import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_app/core/database/db_tables.dart';

class AppDatabase {
  static Database? _database;
  static Future get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'weather.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(DbTables.userLocation);
      },
    );
  }
}
