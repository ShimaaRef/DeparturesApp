import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/search_stops_usecase.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchStopsUseCase searchStopsUseCase;

  SearchBloc({required this.searchStopsUseCase}) : super(SearchInitial()) {
    on<SearchQueryChanged>(_onQueryChanged);
  }

  void _onQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoading());
    final result = await searchStopsUseCase(event.query);

    result.fold(
      (failure) => emit(SearchError(failure.message)),
      (results) => emit(SearchLoaded(results)),
    );
  }
}
