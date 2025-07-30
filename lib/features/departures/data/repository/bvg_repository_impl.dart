import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/departure.dart';
import '../../domain/repositories/bvg_repository.dart';
import '../datasources/bvg_api_service.dart';

class BvgRepositoryImpl implements BvgRepository {
  final BvgApiService apiService;

  BvgRepositoryImpl({required this.apiService});

  @override
  Future<Either<Failure, List<Departure>>> getDepartures(String stopId) async {
    try {
      final departures = await apiService.getDepartures(stopId);
      return Right(departures);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkFailure catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Unexpected error occurred'));
    }
  }
}
