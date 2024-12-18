import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_project/Details/MovieDetail/data/Models/movie_detail/movie_detail.dart';
import 'package:movie_project/Shared/Api/ApiConstant.dart';

class DetailsApiDataSource {
  Future<MovieDetail> getMovieDetail(String MovieId) async {
    final uri = Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.MovieDetailEndPoint + MovieId,
      {},
    );
    final response = await http.get(uri, headers: {
      'Authorization': ApiConstant.apiKey,
    });
    final json = jsonDecode(response.body);
    print(json);
    final MovieDetails = MovieDetail.fromJson(json);
    print(MovieDetails);
    return MovieDetails;
  }
}
