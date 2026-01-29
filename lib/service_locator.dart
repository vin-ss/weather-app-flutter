import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:weather_app/core/database/app_database.dart';
import 'package:weather_app/features/auth/data/repository/imp_auth_repo.dart';
import 'package:weather_app/features/auth/data/sources/auth_remote_data_source.dart';
import 'package:weather_app/features/auth/domain/repository/auth_repo.dart';
import 'package:weather_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:weather_app/features/auth/domain/use_cases/signup_use_case.dart';
import 'package:weather_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:weather_app/features/location/data/repository/imp_location_repo.dart';
import 'package:weather_app/features/location/data/sources/location_local_data_source.dart';
import 'package:weather_app/features/location/domain/repository/location_repo.dart';
import 'package:weather_app/features/location/domain/usecases/get_location_use_case.dart';
import 'package:weather_app/features/location/domain/usecases/save_location_use_case.dart';
import 'package:weather_app/features/weather/data/repository/imp_weather_repo.dart';
import 'package:weather_app/features/weather/data/source/weather_remote_data_source.dart';
import 'package:weather_app/features/weather/domain/repository/weather_repo.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Core - Database (Initialize and register the Database instance)
  final database = await AppDatabase.database;
  sl.registerLazySingleton<Database>(() => database);

  // External dependencies
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<http.Client>(() => http.Client());

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(sl()),
  );
  sl.registerLazySingleton<LocationLocalDataSource>(
    () => LocationLocalDataSource(sl()),
  );
  sl.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSource(client: sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepo>(() => ImpAuthRepo(sl()));
  sl.registerLazySingleton<LocationRepo>(() => ImpLocationRepo(sl()));
  sl.registerLazySingleton<WeatherRepo>(
    () => ImpWeatherRepo(remoteDataSource: sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => GetLocationUseCase(sl()));
  sl.registerLazySingleton(() => SaveLocationUseCase(sl()));

  // BLoCs - Register as factories so each screen gets a fresh instance
  sl.registerFactory(() => AuthBloc(signUpUseCase: sl(), loginUseCase: sl()));
  sl.registerFactory(
    () => WeatherBloc(weatherRepo: sl(), getLocation: sl(), saveLocation: sl()),
  );
}
