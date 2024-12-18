import 'package:collection/collection.dart';

import 'genre.dart';

class MovieCatagory {
  final List<Genre> genres;

  const MovieCatagory({required this.genres});

  factory MovieCatagory.fromJson(Map<String, dynamic> json) => MovieCatagory(
        genres: (json['genres'] as List<dynamic>)
            .map((e) => Genre.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
