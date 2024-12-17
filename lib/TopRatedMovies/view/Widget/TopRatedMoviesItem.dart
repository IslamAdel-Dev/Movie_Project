import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_project/Details/MovieDetail/View/Widget/movieDetail_View.dart';
import 'package:movie_project/Shared/Widget/app_theme.dart';
import 'package:movie_project/TopRatedMovies/data/Models/top_rated_movies.dart';

class Topratedmoviesitem extends StatelessWidget {
  topRatedMovie movies;

  Topratedmoviesitem(this.movies);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(movies.id);
        Navigator.of(context)
            .pushNamed(MoviedetailView.routeName, arguments: movies.id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        height: 180,
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                'https://image.tmdb.org/t/p/w200' + movies.backdropPath,
                fit: BoxFit.fitHeight,
                height: 100,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppTheme.goldenYellow,
                ),
                Text(
                  '${movies.voteAverage}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            Text(movies.title, style: Theme.of(context).textTheme.titleSmall),
            SizedBox(
              width: 3,
            ),
            Row(
              children: [
                Text('${movies.releaseDate.year}',
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
