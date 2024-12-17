import 'dart:convert';
import 'package:movie_project/Shared/Api/ApiConstant.dart';
import 'package:movie_project/TopRatedMovies/data/Models/top_rated_movies.dart';
import 'package:http/http.dart' as http;

class TopRatedAPiMovies {
  Future<List<topRatedMovie>> getTopRatedMovies() async {
    final uri = Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.TopRatedMoviesEndpoint,
      {},
    );
    final response = await http.get(uri, headers: {
      'Authorization': ApiConstant.apiKey,
    });
    final json = jsonDecode(response.body);
    final topRatedMovies = TopRatedMovies.fromJson(json);
    if (topRatedMovies.topRatedMovies != null) {
      return topRatedMovies.topRatedMovies;
    } else {
      throw Exception('Failed get Top Rated Movies');
    }
  }
}
