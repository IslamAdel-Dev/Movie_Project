import 'package:movie_project/Details/MoviesSimilar/data/Models/movie_similar/MovieSimilar.dart';

abstract class MovieSimilarstate {}

class MovieSimilarinit extends MovieSimilarstate {}

class MovieSimilarLoading extends MovieSimilarstate {}

class getMovieSimilarSuccess extends MovieSimilarstate {
  final MovieSimilar MovieSimilars;
  getMovieSimilarSuccess(this.MovieSimilars);
}

class getMovieSimilarError extends MovieSimilarstate {
  String Error;
  getMovieSimilarError(this.Error);
}
