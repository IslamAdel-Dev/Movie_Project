import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_project/Catagory/data/Models/movie_catagory/movie_catagory.dart';
import 'package:movie_project/Shared/Api/api.dart';

Future<MovieCatagory> fetchGenres() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final MovieCatagorys = MovieCatagory.fromJson(data);
    return MovieCatagorys;
  } else {
    throw Exception('Failed to load genres');
  }
}
