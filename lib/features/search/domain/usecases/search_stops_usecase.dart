import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/stop_search_result.dart';
import '../repositories/search_repository.dart';

class SearchStopsUseCase {
  final SearchRepository repository;

  SearchStopsUseCase(this.repository);

  Future<Either<Failure, List<StopSearchResult>>> call(String query) {
    return repository.searchStops(query);
  }
}
