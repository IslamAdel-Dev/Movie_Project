import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_project/Search/data/models/search_source_response.dart';
import 'package:movie_project/Shared/Api/popular_api_constant.dart';

class SourcesDataSourceSearch {
  static Future<SearchSourceResponse> getSearchedMovies(String search) async {
    final uri = Uri.https(
        PopularApiConstant.baseurl,
        PopularApiConstant.sourceEndPointSearch,
        {"api_key": PopularApiConstant.api_key, "query": search});
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      print('Error: ${response.body}');
      throw Exception('Failed to load movies: ${response.statusCode}');
    }
    final json = jsonDecode(response.body);
    return SearchSourceResponse.fromJson(json);
  }
}