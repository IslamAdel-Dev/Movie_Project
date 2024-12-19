import 'package:movie_project/carousel/data/models/source.dart';

class SourceResponse {
  int? page;
  List<Source>? results;
  int? totalPages;
  int? totalResults;

  SourceResponse({this.page, this.results, this.totalPages, this.totalResults});

  SourceResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Source>[];
      json['results'].forEach((v) {
        results!.add(new Source.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
