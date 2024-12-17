import 'package:flutter/material.dart';
import 'package:movies_app/TopRatedMovies/view/Widget/TopRatedMoviesList.dart';
import 'package:movies_app/app_theme.dart';

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
