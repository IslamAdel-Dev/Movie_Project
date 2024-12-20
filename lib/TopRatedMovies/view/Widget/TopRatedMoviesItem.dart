import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_project/Details/MovieDetail/View/Widget/movieDetail_View.dart';
import 'package:movie_project/Shared/Widget/app_theme.dart';
import 'package:movie_project/Shared/firebase_function.dart';
import 'package:movie_project/TopRatedMovies/data/Models/top_rated_movies.dart';
import 'package:movie_project/WatchList/MovieWatchListModel.dart';
import 'package:movie_project/WatchList/WatchlistProvider.dart';
import 'package:provider/provider.dart';

class Topratedmoviesitem extends StatefulWidget {
  topRatedMovie movies;
  late bool toggle;
  late MoviewatchlistModel MovieWatchlist;

  Topratedmoviesitem(this.movies);

  @override
  State<Topratedmoviesitem> createState() => _TopratedmoviesitemState();
}

class _TopratedmoviesitemState extends State<Topratedmoviesitem> {
  @override
  Widget build(BuildContext context) {
    watchListProvider watchlists = Provider.of<watchListProvider>(context);
    watchlists.getnewWatchList();
    print(watchlists.MovieIds);
    widget.toggle = watchlists.checkWatchList(widget.movies.id.toString());
    widget.MovieWatchlist = MoviewatchlistModel(
      Auther: '',
      Year: widget.movies.releaseDate.year.toString(),
      movieId: widget.movies.id.toString(),
      photopath: widget.movies.backdropPath,
      tilte: widget.movies.title,
    );
    return GestureDetector(
      onTap: () {
        print(widget.movies.id);
        Navigator.of(context)
            .pushNamed(MoviedetailView.routeName, arguments: widget.movies.id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        height: 180,
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w200' +
                        widget.movies.backdropPath,
                    fit: BoxFit.fitHeight,
                    height: 180,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (widget.toggle == true) {
                        watchlists.checkWatchList(widget.movies.id.toString())
                            ? FirebaseFuncions.deleteMoive(
                                widget.MovieWatchlist)
                            : null;
                        widget.toggle = !widget.toggle;
                        setState(() {});
                      } else {
                        print(watchlists
                            .checkWatchList(widget.movies.id.toString()));
                        watchlists.checkWatchList(widget.movies.id.toString())
                            ? null
                            : FirebaseFuncions.addmovie(widget.MovieWatchlist);

                        widget.toggle = !widget.toggle;
                        setState(() {});
                      }
                      ;
                    },
                    child: Image(
                      image: widget.toggle
                          ? AssetImage(
                              'assets/images/Icon awesome-bookmark yellow.png',
                            )
                          : AssetImage(
                              'assets/images/Icon awesome-bookmark.png'),
                    ),
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
                  '${widget.movies.voteAverage.toInt()}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            Text(widget.movies.title,
                style: Theme.of(context).textTheme.titleSmall),
            SizedBox(
              width: 3,
            ),
            Row(
              children: [
                Text('${widget.movies.releaseDate.year}',
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
