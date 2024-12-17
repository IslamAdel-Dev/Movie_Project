import 'package:movie_project/Details/MovieDetail/data/Models/movie_detail/movie_detail.dart';
import 'package:movie_project/Details/MovieDetail/data/data_Source/details_api_data_source.dart';

class Moviedetailrepository {
  final MovieDetailApi = DetailsApiDataSource();

  Future<MovieDetail> getMovieDetail(String MoiveId) async {
    return await MovieDetailApi.getMovieDetail(MoiveId);
  }
}
