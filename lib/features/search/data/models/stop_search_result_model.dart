import '../../domain/entities/stop_search_result.dart';

class StopSearchResultModel extends StopSearchResult {
  const StopSearchResultModel({
    required super.id,
    required super.name,
    required super.modes,
  });

  factory StopSearchResultModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> lines = json['lines'] ?? [];

    final modes = lines
        .map<String>((line) => line['mode']?.toString() ?? '')
        .toSet()
        .where((m) => m.isNotEmpty)
        .toList();

    return StopSearchResultModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      modes: modes,
    );
  }
}
