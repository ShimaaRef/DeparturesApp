import 'package:equatable/equatable.dart';

class Departure extends Equatable {
  final String lineName;
  final String direction;
  final DateTime plannedDeparture;
  final bool isDelayed;
  final String? platform;
  final String transportType;

  const Departure({
    required this.lineName,
    required this.direction,
    required this.plannedDeparture,
    required this.isDelayed,
    this.platform,
    required this.transportType,
  });

  @override
  List<Object?> get props => [
    lineName,
    direction,
    plannedDeparture,
    isDelayed,
    platform,
    transportType,
  ];
}
