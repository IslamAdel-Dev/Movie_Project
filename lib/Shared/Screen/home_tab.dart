import 'package:flutter/material.dart';
import 'package:movie_project/Shared/Widget/app_theme.dart';
import 'package:movie_project/TopRatedMovies/view/Widget/TopRatedMoviesList.dart';
import 'package:movie_project/carousel/view/widgets/movie_carousel.dart';
import 'package:movie_project/newReleaseMovies/view/Widget/new_releases_reated_moviesList.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.33,
              width: double.infinity,
              child: MovieCarousel()),
          SizedBox(
            height: 15,
          ),
          Container(
            color: AppTheme.mediumDarkGrey,
            child: Padding(
              padding: EdgeInsets.only(left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text('NEW RELEASE'),
                  SizedBox(
                    height: 10,
                  ),
                  NewReleasesReatedMovieslist(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
              color: AppTheme.mediumDarkGrey,
              child: Padding(
                padding: EdgeInsets.only(left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('TOP RATED'),
                    ),
                    topRatedMoviesList(),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
