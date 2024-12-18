import 'package:flutter/material.dart';

class MoviewatchlistModel {
  String movieId;
  String tilte;
  String photopath;
  String Year;
  String? Auther;

  MoviewatchlistModel({
    required this.movieId,
    required this.tilte,
    required this.photopath,
    required this.Year,
    required this.Auther,
  });

  MoviewatchlistModel.fromjson(Map<String, dynamic> json)
      : this(
          movieId: json['id'],
          tilte: json['title'],
          photopath: json['photopath'],
          Year: json['year'],
          Auther: json['auther'],
        );

  Map<String, dynamic> tojson() => {
        'id': movieId,
        'title': tilte,
        'photopath': photopath,
        'year': Year,
        'auther': Auther,
      };
}
