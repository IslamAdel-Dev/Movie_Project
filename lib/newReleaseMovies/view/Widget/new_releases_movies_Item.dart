import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_project/Details/MovieDetail/View/Widget/movieDetail_View.dart';
import 'package:movie_project/Details/MovieDetail/data/Models/movie_detail/movie_detail.dart';
import 'package:movie_project/Shared/Widget/app_theme.dart';
import 'package:movie_project/Shared/firebase_function.dart';
import 'package:movie_project/WatchList/MovieWatchListModel.dart';
import 'package:movie_project/newReleaseMovies/data/models/results.dart';

class NewReleasesMoviesItem extends StatefulWidget {
  Results movies;
  late MoviewatchlistModel MovieWatchlist;

  NewReleasesMoviesItem(this.movies);

  @override
  State<NewReleasesMoviesItem> createState() => _NewReleasesMoviesItemState();
}

class _NewReleasesMoviesItemState extends State<NewReleasesMoviesItem> {
  bool toggle = true;

  @override
  Widget build(BuildContext context) {
    widget.MovieWatchlist = MoviewatchlistModel(
        Auther: '',
        Year: widget.movies.releaseDate ?? '',
        movieId: widget.movies.id.toString(),
        photopath: widget.movies.backdropPath ?? '',
        tilte: widget.movies.title ?? '');
    return GestureDetector(
      onTap: () {
        print(widget.movies.id);
        Navigator.of(context)
            .pushNamed(MoviedetailView.routeName, arguments: widget.movies.id);
      },
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 3),
        height: 180,
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w200' +
                        widget.movies.backdropPath!,
                    fit: BoxFit.fitHeight,
                    height: 180,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: GestureDetector(
                      onTap: () {
                        toggle = !toggle;

                        FirebaseFuncions.addmovie(widget.MovieWatchlist);
                        setState(() {});
                      },
                      child: Image(
                        image: toggle
                            ? AssetImage('assets/images/bookmark.png')
                            : AssetImage(
                                'assets/images/Icon awesome-bookmark.png'),
                      ),
                    ),
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppTheme.goldenYellow,
                ),
                Text(
                  '${widget.movies.voteAverage!.toInt()}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            Text(widget.movies.title!,
                style: Theme.of(context).textTheme.titleSmall),
            SizedBox(
              width: 3,
            ),
            Row(
              children: [
                Text('${widget.movies.releaseDate!}',
                    style: Theme.of(context).textTheme.labelSmall),
                SizedBox(
                  width: 3,
                ),
                SizedBox(
                  width: 3,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
