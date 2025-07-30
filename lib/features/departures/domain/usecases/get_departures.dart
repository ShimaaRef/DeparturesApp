import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/departure.dart';
import '../repositories/bvg_repository.dart';

class GetDeparturesUseCase {
  final BvgRepository repository;

  GetDeparturesUseCase(this.repository);

  Future<Either<Failure, List<Departure>>> call(String stopId) async {
    return await repository.getDepartures(stopId);
  }
}
