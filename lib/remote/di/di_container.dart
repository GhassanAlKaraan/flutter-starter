import 'package:flutter_starter/remote/constants/app_constants.dart';
import 'package:flutter_starter/remote/constants/config_model.dart';
import 'package:flutter_starter/remote/utils/dio/dio_client.dart';
import 'package:flutter_starter/remote/utils/dio/logging_interceptor.dart';
import 'package:flutter_starter/remote/providers/auth_provider.dart';
import 'package:flutter_starter/remote/providers/example_provider.dart';
import 'package:flutter_starter/remote/repositories/auth_repository.dart';
import 'package:flutter_starter/remote/repositories/example_repository.dart';

import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient(BaseUrls.productionAPi, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => ExampleRepo(dioClient: sl()));

  // Providers
  sl.registerFactory(() => AuthProvider(authRepo: sl()));
  sl.registerFactory(() => ExampleProvider(exampleRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());

  sharedPreferences.setBool(AppConstants.push, true);
}
