import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/departure.dart';

abstract class BvgRepository {
  Future<Either<Failure, List<Departure>>> getDepartures(String stopId);
}
