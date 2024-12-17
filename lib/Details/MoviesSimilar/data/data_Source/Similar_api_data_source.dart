import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_project/Details/MoviesSimilar/data/Models/movie_similar/MovieSimilar.dart';
import 'package:movie_project/Shared/Api/ApiConstant.dart';

class SimilarApiDataSource {
  Future<MovieSimilar> getMovieSmiliar(String MovieId) async {
    final uri = Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.MovieDetailEndPoint + MovieId + '/similar',
      {},
    );
    final response = await http.get(uri, headers: {
      'Authorization': ApiConstant.apiKey,
    });
    final json = jsonDecode(response.body);
    final MovieDetails = MovieSimilar.fromJson(json);
    return MovieDetails;
  }
}
