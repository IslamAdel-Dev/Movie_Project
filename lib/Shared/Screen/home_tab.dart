import 'package:flutter/material.dart';
import 'package:movie_project/TopRatedMovies/view/Widget/TopRatedMoviesList.dart';

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
          Spacer(),
          topRatedMoviesList(),
        ],
      ),
    );
  }
}
