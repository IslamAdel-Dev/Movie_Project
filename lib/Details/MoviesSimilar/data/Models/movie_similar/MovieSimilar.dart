import 'package:movie_project/Details/MoviesSimilar/data/Models/movie_similar/Results.dart';

class MovieSimilar {
  int? page;
  List<Resultss>? results;
  int? totalPages;
  int? totalResults;

  MovieSimilar({this.page, this.results, this.totalPages, this.totalResults});

  MovieSimilar.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Resultss>[];
      json['results'].forEach((v) {
        results!.add(new Resultss.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
