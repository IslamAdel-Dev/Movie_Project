import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_project/Shared/Api/api.dart';

Future<List<Map<String, dynamic>>> fetchGenres() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en'));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.cast<Map<String, dynamic>>();
  } else {
    throw Exception('Failed to load genres');
  }
}
