import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/failures.dart';
import '../../../../core/utils/constants.dart';
import '../models/departure_model.dart';

class BvgApiService {
  final http.Client client;

  BvgApiService({required this.client});

  Future<List<DepartureModel>> getDepartures(String stopId) async {
    try {
      final url = Uri.parse(
        '${ApiConstants.baseUrl}/stops/$stopId/departures?results=30',
      );
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((e) => DepartureModel.fromJson(e)).toList();
      } else {
        throw ServerFailure(
          'API responded with status: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw NetworkFailure('Failed to connect: ${e.toString()}');
    }
  }
}
