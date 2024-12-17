import 'package:movie_project/Details/MoviesSimilar/data/Models/movie_similar/MovieSimilar.dart';
import 'package:movie_project/Details/MoviesSimilar/data/data_Source/Similar_api_data_source.dart';

class MovieSimilarrepository {
  final MovieDetailApi = SimilarApiDataSource();

  Future<MovieSimilar> getMovieSimilar(String MoiveId) async {
    return await MovieDetailApi.getMovieSmiliar(MoiveId);
  }
}
