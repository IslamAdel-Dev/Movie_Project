// import 'package:movie_project/Details/MoviesSimilar/data/Models/movie_similar/Results.dart';
import 'package:movie_project/newReleaseMovies/data/data_Source/new_releses_api_data_Source.dart';
import 'package:movie_project/newReleaseMovies/data/models/results.dart';

class NewRelesesMoviesRepository {
  final newReleasesApi = NewRelesesApiDataSource();

  Future<List<Results>> getNewReleasesMovies() async {
    return newReleasesApi.getNewReleases();
  }
}
