import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/stop_search_result_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<StopSearchResultModel>> searchStops(String query);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final http.Client client;

  SearchRemoteDataSourceImpl({required this.client});

  @override
  Future<List<StopSearchResultModel>> searchStops(String query) async {
    final url = Uri.parse('https://v6.bvg.transport.rest/stops?query=$query');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data
          .map<StopSearchResultModel>((e) => StopSearchResultModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to fetch stops');
    }
  }
}
