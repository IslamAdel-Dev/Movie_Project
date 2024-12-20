import 'package:flutter/material.dart';
import 'package:movie_project/Shared/Widget/app_theme.dart';
import 'package:movie_project/Shared/Widget/loading_indicator.dart';
import 'package:movie_project/Shared/firebase_function.dart';
import 'package:movie_project/WatchList/MovieWatchListModel.dart';
import 'package:movie_project/WatchList/WatchlistProvider.dart';
import 'package:movie_project/WatchList/custom_watchlist.dart';
import 'package:provider/provider.dart';

class WatchlistTab extends StatefulWidget {
  @override
  State<WatchlistTab> createState() => _WatchlistTabState();
}

class _WatchlistTabState extends State<WatchlistTab> {
  List<MoviewatchlistModel> Movie = [];
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    if (Movie.isEmpty && isloading == false) {
      getWatchList();
      isloading = true;
    }
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Watchlist',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppTheme.white,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Movie.length,
              itemBuilder: (context, index) {
                print(Movie);
                return CustomWatchlist(Movie[index], getnewWatchList);
              },
            ),
          ),
        ],
      ),
    ));
  }

  Future<void> getWatchList() async {
    watchListProvider Watchlists =
        Provider.of<watchListProvider>(context, listen: false);
    Movie = await FirebaseFuncions.getallMovieWatchlist();
    Watchlists.getnewWatchList();
    setState(() {});
  }

  Future<void> getnewWatchList() async {
    await getWatchList();
  }
}
