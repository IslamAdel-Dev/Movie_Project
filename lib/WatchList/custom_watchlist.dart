import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_project/Details/MovieDetail/View/Widget/movieDetail_View.dart';
import 'package:movie_project/Shared/Widget/app_theme.dart';
import 'package:movie_project/Shared/firebase_function.dart';
import 'package:movie_project/WatchList/MovieWatchListModel.dart';

class CustomWatchlist extends StatefulWidget {
  MoviewatchlistModel Movie;
  CustomWatchlist(this.Movie, this.getnewWatchList);
  Function getnewWatchList;

  @override
  State<CustomWatchlist> createState() => _CustomWatchlistState();
}

class _CustomWatchlistState extends State<CustomWatchlist> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          color: AppTheme.darkBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(MoviedetailView.routeName,
                    arguments: widget.Movie.movieId);
              },
              child: Row(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w200${widget.Movie.photopath}',
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          FirebaseFuncions.deleteMoive(widget.Movie),
                          widget.getnewWatchList(),
                        },
                        child: Image.asset(
                            'assets/images/Icon awesome-bookmark yellow.png'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.Movie.tilte,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppTheme.white,
                                  ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.Movie.movieId,
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: AppTheme.white.withOpacity(0.6745),
                                  ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.Movie.Auther ?? '',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: AppTheme.white.withOpacity(0.6745),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
          width: 358,
          child: Divider(
            color: AppTheme.grey70,
            thickness: 1,
          ),
        )
      ],
    );
  }
}
