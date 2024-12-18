import 'dart:convert';
// import 'package:movie_project/Details/MoviesSimilar/data/Models/movie_similar/Results.dart';
import 'package:movie_project/Shared/Api/ApiConstant.dart';
import 'package:http/http.dart' as http;
import 'package:movie_project/newReleaseMovies/data/Models/new_releses_movies.dart';
import 'package:movie_project/newReleaseMovies/data/models/results.dart';

class NewRelesesApiDataSource {
  Future<List<Results>> getNewReleases() async {
    final uri = Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.newReleasesMoviesEndpoint,
      {},
    );
    final response = await http.get(uri, headers: {
      'Authorization': ApiConstant.token,
    });
    final json = jsonDecode(response.body);
    final newReleasesRespons = NewReleasesRespons.fromJson(json);
    if (newReleasesRespons.results != null) {
      return newReleasesRespons.results!;
    } else {
      throw Exception('Failed get new releases Movies');
    }
  }
}
