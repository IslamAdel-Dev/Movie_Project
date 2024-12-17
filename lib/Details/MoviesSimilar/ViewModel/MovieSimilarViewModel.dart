import 'package:movie_project/Details/MoviesSimilar/Repository/movieSimilarRepository.dart';
import 'package:movie_project/Details/MoviesSimilar/ViewModel/MovieSimilarState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieSimilarviewmodel extends Cubit<MovieSimilarstate> {
  final repository = MovieSimilarrepository();

  MovieSimilarviewmodel() : super(MovieSimilarinit());

  Future<void> getMovieSimilar(String MoiveId) async {
    emit(MovieSimilarLoading());
    try {
      final similarmovie = await repository.getMovieSimilar(MoiveId);
      emit(getMovieSimilarSuccess(similarmovie));
    } catch (error) {
      print(error.toString());
      emit(getMovieSimilarError(error.toString()));
    }
  }
}
