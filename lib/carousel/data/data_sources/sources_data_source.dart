import 'package:movie_project/carousel/data/models/source_response.dart';
import 'package:movie_project/Shared/Api/popular_api_constant.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;


class SourcesDataSource {
  static Future<SourceResponse> getMovies() async {
    final uri = Uri.https(
        PopularApiConstant.baseurl, PopularApiConstant.sourceEndPoint, {
      'api_key': PopularApiConstant.api_key,
    });

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      print('Error: ${response.body}');
      throw Exception('Failed to load movies: ${response.statusCode}');
    }

    final json = jsonDecode(response.body);
    return SourceResponse.fromJson(json);
  }
}