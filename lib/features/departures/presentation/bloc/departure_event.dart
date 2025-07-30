import 'package:equatable/equatable.dart';

abstract class DepartureEvent extends Equatable {
  const DepartureEvent();

  @override
  List<Object?> get props => [];
}

class FetchDepartures extends DepartureEvent {
  final String stopId;

  const FetchDepartures(this.stopId);

  @override
  List<Object?> get props => [stopId];
}
