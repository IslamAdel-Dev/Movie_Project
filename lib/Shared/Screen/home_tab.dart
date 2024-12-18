import 'package:flutter/material.dart';
import 'package:movie_project/TopRatedMovies/view/Widget/TopRatedMoviesList.dart';
import 'package:movie_project/carousel/view/widgets/movie_carousel.dart';

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
          Spacer(),
          topRatedMoviesList(),
        ],
      ),
    );
  }
}
