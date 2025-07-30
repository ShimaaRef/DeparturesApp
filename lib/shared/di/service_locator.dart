import 'package:departures_app/features/search/data/datasources/search_remote_data_source.dart';
import 'package:departures_app/features/search/data/repository/search_repository_impl.dart';
import 'package:departures_app/features/search/domain/repositories/search_repository.dart';
import 'package:departures_app/features/search/domain/usecases/search_stops_usecase.dart';
import 'package:departures_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../features/departures/data/datasources/bvg_api_service.dart';
import '../../features/departures/data/repository/bvg_repository_impl.dart';
import '../../features/departures/domain/repositories/bvg_repository.dart';
import '../../features/departures/domain/usecases/get_departures.dart';
import '../../features/departures/presentation/bloc/departure_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => DepartureBloc(getDeparturesUseCase: sl()));

  // UseCases
  sl.registerLazySingleton(() => GetDeparturesUseCase(sl()));

  // Repository
  sl.registerLazySingleton<BvgRepository>(
    () => BvgRepositoryImpl(apiService: sl()),
  );

  // Data sources
  sl.registerLazySingleton(() => BvgApiService(client: sl()));

  //  BLoC
  sl.registerFactory(() => SearchBloc(searchStopsUseCase: sl()));

  // UseCase
  sl.registerLazySingleton(() => SearchStopsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(remoteDataSource: sl()),
  );

  // Data Source
  sl.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(client: sl()),
  );

  // External (http)
  sl.registerLazySingleton(() => http.Client());
}
