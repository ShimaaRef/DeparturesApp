import '../../domain/entities/stop_search_result.dart';

class StopSearchResultModel extends StopSearchResult {
  const StopSearchResultModel({
    required super.id,
    required super.name,
    required super.modes,
  });

  factory StopSearchResultModel.fromJson(Map<String, dynamic> json) {
    return StopSearchResultModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      modes: const [], // No modes in /stops?query= response
    );
  }
}
