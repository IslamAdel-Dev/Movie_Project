import 'package:flutter/material.dart';
import 'package:movie_project/Shared/firebase_function.dart';
import 'package:movie_project/WatchList/MovieWatchListModel.dart';

class watchListProvider with ChangeNotifier {
  List<MoviewatchlistModel> Movies = [];
  List<String> MovieIds = [];

  Future<void> getnewWatchList() async {
    Movies = await FirebaseFuncions.getallMovieWatchlist();
    MovieIds = Movies.map((movie) => movie.movieId).toList();
    notifyListeners();
  }

  bool checkWatchList(String movieId) {
    return MovieIds.contains(movieId);
  }
}
