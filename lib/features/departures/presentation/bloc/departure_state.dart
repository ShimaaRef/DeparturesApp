import 'package:equatable/equatable.dart';

import '../../domain/entities/departure.dart';

abstract class DepartureState extends Equatable {
  const DepartureState();

  @override
  List<Object?> get props => [];
}

class DepartureInitial extends DepartureState {}

class DepartureLoading extends DepartureState {}

class DepartureLoaded extends DepartureState {
  final List<Departure> departures;

  const DepartureLoaded(this.departures);

  @override
  List<Object?> get props => [departures];
}

class DepartureError extends DepartureState {
  final String message;

  const DepartureError(this.message);

  @override
  List<Object?> get props => [message];
}
