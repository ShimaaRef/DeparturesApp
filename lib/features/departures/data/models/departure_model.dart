import '../../domain/entities/departure.dart';

class DepartureModel extends Departure {
  const DepartureModel({
    required super.lineName,
    required super.direction,
    required super.plannedDeparture,
    required super.isDelayed,
    required super.platform,
    required super.transportType,
  });

  factory DepartureModel.fromJson(Map<String, dynamic> json) {
    final plannedTime =
        DateTime.tryParse(json['plannedWhen'] ?? '') ?? DateTime.now();
    final delayMinutes = (json['delay'] ?? 0) > 0;

    return DepartureModel(
      lineName: json['line']['name'] ?? '',
      direction: json['direction'] ?? '',
      plannedDeparture: plannedTime,
      isDelayed: delayMinutes,
      platform: json['platform'],
      transportType: json['line']['mode'] ?? 'bus',
    );
  }
}
