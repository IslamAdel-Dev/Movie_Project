import 'package:flutter/material.dart';
import 'package:movie_project/Details/MovieDetail/View/Widget/movieDetail_View.dart';
import 'package:movie_project/Details/MoviesSimilar/data/Models/movie_similar/Results.dart';
import 'package:movie_project/Shared/Widget/app_theme.dart';
import 'package:movie_project/Shared/firebase_function.dart';
import 'package:movie_project/WatchList/MovieWatchListModel.dart';
import 'package:movie_project/WatchList/WatchlistProvider.dart';
import 'package:provider/provider.dart';

class Similarmoviesitem extends StatefulWidget {
  Resultss SimilarMovie;
  late bool toggle;
  late MoviewatchlistModel MovieWatchlist;

  Similarmoviesitem(this.SimilarMovie);

  @override
  State<Similarmoviesitem> createState() => _SimilarmoviesitemState();
}

class _SimilarmoviesitemState extends State<Similarmoviesitem> {
  @override
  Widget build(BuildContext context) {
    watchListProvider watchlists = Provider.of<watchListProvider>(context);
    watchlists.getnewWatchList();
    print(watchlists.MovieIds);
    widget.toggle =
        watchlists.checkWatchList(widget.SimilarMovie.id.toString());
    widget.MovieWatchlist = MoviewatchlistModel(
        Auther: '',
        Year: widget.SimilarMovie.releaseDate ?? '',
        movieId: widget.SimilarMovie.id.toString(),
        photopath: widget.SimilarMovie.backdropPath ?? '',
        tilte: widget.SimilarMovie.title ?? '');
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(MoviedetailView.routeName,
            arguments: widget.SimilarMovie.id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        height: 150,
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: 100,
                child: Stack(
                  children: [
                    Expanded(
                      child: Image.network(
                        widget.SimilarMovie.backdropPath != null
                            ? 'https://image.tmdb.org/t/p/original${widget.SimilarMovie.backdropPath}'
                            : 'https://st.depositphotos.com/1987177/3470/v/450/depositphotos_34700099-stock-illustration-no-photo-available-or-missing.jpg',
                        fit: BoxFit.fill,
                        height: 130,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (widget.toggle == true) {
                          watchlists.checkWatchList(
                                  widget.SimilarMovie.id.toString())
                              ? FirebaseFuncions.deleteMoive(
                                  widget.MovieWatchlist)
                              : null;
                          widget.toggle = !widget.toggle;
                          setState(() {});
                        } else {
                          print(watchlists.checkWatchList(
                              widget.SimilarMovie.id.toString()));
                          watchlists.checkWatchList(
                                  widget.SimilarMovie.id.toString())
                              ? null
                              : FirebaseFuncions.addmovie(
                                  widget.MovieWatchlist);

                          widget.toggle = !widget.toggle;
                          setState(() {});
                        }
                        ;
                      },
                      child: widget.toggle
                          ? Image.asset(
                              'assets/images/Icon awesome-bookmark yellow.png')
                          : Image.asset(
                              'assets/images/Icon awesome-bookmark.png'),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppTheme.goldenYellow,
                ),
                Text(
                  '${widget.SimilarMovie.voteAverage}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            Text(widget.SimilarMovie.title ?? '',
                style: Theme.of(context).textTheme.titleSmall),
            SizedBox(
              width: 3,
            ),
            Row(
              children: [
                Text(
                    '${widget.SimilarMovie.releaseDate?.split('-').first ?? ''}',
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
