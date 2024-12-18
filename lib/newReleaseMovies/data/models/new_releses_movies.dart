import 'package:movie_project/newReleaseMovies/data/models/dates.dart';
import 'package:movie_project/newReleaseMovies/data/models/results.dart';

class NewReleasesRespons {
  Dates? dates;
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  NewReleasesRespons(
      {this.dates,
      this.page,
      this.results,
      this.totalPages,
      this.totalResults});

  NewReleasesRespons.fromJson(Map<String, dynamic> json) {
    dates = json['dates'] != null ? new Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
