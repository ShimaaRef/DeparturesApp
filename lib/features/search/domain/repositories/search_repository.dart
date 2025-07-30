import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/stop_search_result.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<StopSearchResult>>> searchStops(String query);
}
