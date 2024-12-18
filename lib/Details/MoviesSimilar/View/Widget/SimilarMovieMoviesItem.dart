import 'package:flutter/material.dart';
import 'package:movie_project/Details/MovieDetail/View/Widget/movieDetail_View.dart';
import 'package:movie_project/Details/MoviesSimilar/data/Models/movie_similar/Results.dart';
import 'package:movie_project/Shared/Widget/app_theme.dart';

class Similarmoviesitem extends StatelessWidget {
  Results SimilarMovie;

  Similarmoviesitem(this.SimilarMovie);

  @override
  Widget build(BuildContext context) {
    print(SimilarMovie.backdropPath);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MoviedetailView.routeName, arguments: SimilarMovie.id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        height: 150,
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                SimilarMovie.backdropPath != null
                    ? 'https://image.tmdb.org/t/p/original${SimilarMovie.backdropPath}'
                    : 'https://st.depositphotos.com/1987177/3470/v/450/depositphotos_34700099-stock-illustration-no-photo-available-or-missing.jpg',
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
                  '${SimilarMovie.voteAverage}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            Text(SimilarMovie.title ?? '',
                style: Theme.of(context).textTheme.titleSmall),
            SizedBox(
              width: 3,
            ),
            Row(
              children: [
                Text('${SimilarMovie.releaseDate?.split('-').first ?? ''}',
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
