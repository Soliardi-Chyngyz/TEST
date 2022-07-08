import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test/data/repositories/repository_auth.dart';
import 'package:test/data/repositories/repository_ski.dart';
import 'package:test/ui/screens/auth/bloc/bloc_auth.dart';
import 'package:test/ui/screens/ski/bloc/bloc_ski.dart';

import '../../data/network/dio_service.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dio service
  injector.registerLazySingleton(() => DioService());

  // Blocs
  injector.registerLazySingleton<BlocAuth>(() => BlocAuth(injector()));
  injector.registerLazySingleton<BlocSki>(() => BlocSki(injector()));

  // Cubits

  // Repositories
  injector.registerSingleton<RepositoryAuth>(RepositoryAuth(injector()));
  injector.registerSingleton<RepositorySki>(RepositorySki(injector()));
}
