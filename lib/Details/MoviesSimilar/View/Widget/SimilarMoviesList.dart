import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_project/Details/MoviesSimilar/View/Widget/SimilarMovieMoviesItem.dart';
import 'package:movie_project/Details/MoviesSimilar/ViewModel/MovieSimilarState.dart';
import 'package:movie_project/Details/MoviesSimilar/ViewModel/MovieSimilarViewModel.dart';
import 'package:movie_project/Shared/Widget/app_theme.dart';
import 'package:movie_project/Shared/Widget/error_indicator.dart';
import 'package:movie_project/Shared/Widget/loading_indicator.dart';

class SimilarMoviesList extends StatefulWidget {
  @override
  State<SimilarMoviesList> createState() => _topRatedMoviesListState();
  String movieId;
  SimilarMoviesList(this.movieId);
}

class _topRatedMoviesListState extends State<SimilarMoviesList> {
  final viewModel = MovieSimilarviewmodel();

  @override
  Widget build(BuildContext context) {
    viewModel.getMovieSimilar(widget.movieId);
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<MovieSimilarviewmodel, MovieSimilarstate>(
        builder: (_, state) {
          if (state is MovieSimilarLoading) {
            return LoadingIndicator();
          } else if (state is getMovieSimilarError) {
            return ErrorIndicator();
          } else if (state is getMovieSimilarSuccess) {
            return SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) =>
                    Similarmoviesitem(state.MovieSimilars.results![index]),
                itemCount: state.MovieSimilars.results?.length,
              ),
            );
          } else {
            return Text(
              'Failed to get Movie ',
              style: TextStyle(color: AppTheme.white),
            );
          }
        },
      ),
    );
  }
}
