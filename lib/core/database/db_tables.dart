class DbTables {
  static const String userLocation = '''
    CREATE TABLE user_location (
      id INTEGER PRIMARY KEY,
      country TEXT,
      city TEXT
    )
  ''';
}
