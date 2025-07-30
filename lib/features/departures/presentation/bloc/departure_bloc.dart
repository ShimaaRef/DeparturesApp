import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_departures.dart';
import 'departure_event.dart';
import 'departure_state.dart';

class DepartureBloc extends Bloc<DepartureEvent, DepartureState> {
  final GetDeparturesUseCase getDeparturesUseCase;

  DepartureBloc({required this.getDeparturesUseCase})
    : super(DepartureInitial()) {
    on<FetchDepartures>(_onFetchDepartures);
  }

  void _onFetchDepartures(
    FetchDepartures event,
    Emitter<DepartureState> emit,
  ) async {
    emit(DepartureLoading());
    final result = await getDeparturesUseCase(event.stopId);

    result.fold(
      (failure) => emit(DepartureError(failure.message)),
      (departures) => emit(DepartureLoaded(departures)),
    );
  }
}
