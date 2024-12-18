// import 'package:movie_project/Details/MoviesSimilar/data/Models/movie_similar/Results.dart';
import 'package:movie_project/TopRatedMovies/data/Models/top_rated_movies.dart';
import 'package:movie_project/newReleaseMovies/data/Models/new_releses_movies.dart';
import 'package:movie_project/newReleaseMovies/data/models/results.dart';

abstract class NewReleasesStates {}

class NewReleasesInit extends NewReleasesStates {}

class getNewReleasesMoviesLoading extends NewReleasesStates {}

class getNewReleasesMoviesSuccess extends NewReleasesStates {
  final List<Results> newReleases;
  getNewReleasesMoviesSuccess(this.newReleases);
}

class getNewReleasesMoviesError extends NewReleasesStates {
  String error;
  getNewReleasesMoviesError(this.error);
}
