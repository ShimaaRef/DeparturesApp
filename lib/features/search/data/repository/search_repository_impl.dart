import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/stop_search_result.dart';
import '../../domain/repositories/search_repository.dart';
import '../datasources/search_remote_data_source.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<StopSearchResult>>> searchStops(
    String query,
  ) async {
    try {
      final results = await remoteDataSource.searchStops(query);
      return Right(results);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
