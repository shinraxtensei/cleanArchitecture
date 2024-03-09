import 'package:clean_architecture/features/cats/data/datasources/get_remote_cats.dart';
import 'package:clean_architecture/features/cats/data/repositories/cat_repository_imp.dart';
import 'package:clean_architecture/features/cats/domain/repositories/cat_repository.dart';
import 'package:clean_architecture/features/cats/domain/usecases/get_cats.dart';
import 'package:clean_architecture/features/cats/presentation/bloc/cats_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // External
  debugPrint("Registering http.Client");
  sl.registerLazySingleton(() => http.Client());

  // Data sources
  debugPrint("Registering GetRemoteCatsDataSource");
  sl.registerLazySingleton<GetCatsDataSource>(
    () => GetRemoteCatsDataSource(sl()),
  );

  // Repository
  debugPrint("Registering CatRepositoryImp");
  sl.registerLazySingleton<CatRepository>(() => CatRepositoryImp(sl()));

  // Use cases
  debugPrint("Registering GetCatsUseCase");
  sl.registerLazySingleton(() => GetCatsUseCase(sl()));

  // Bloc
  debugPrint("Registering CatsBloc");
  sl.registerFactory(
    () => CatsBloc(
      sl(),
    ),
  );
}
