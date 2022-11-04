import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/space_x_model.dart';

class SpaceXRepository {
  final String _baseUrl = "https://api.spacexdata.com/v4/launches";

  Future<List<SpaceXModel>> getFlyData() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => SpaceXModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
