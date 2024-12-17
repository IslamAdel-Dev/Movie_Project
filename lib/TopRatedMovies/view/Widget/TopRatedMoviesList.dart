import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_project/Shared/Widget/app_theme.dart';
import 'package:movie_project/Shared/Widget/error_indicator.dart';
import 'package:movie_project/Shared/Widget/loading_indicator.dart';
import 'package:movie_project/TopRatedMovies/view/Widget/TopRatedMoviesItem.dart';
import 'package:movie_project/TopRatedMovies/viewModel/TopRatedStates.dart';
import 'package:movie_project/TopRatedMovies/viewModel/TopRatedViewModel.dart';

class topRatedMoviesList extends StatefulWidget {
  @override
  State<topRatedMoviesList> createState() => _topRatedMoviesListState();
}

class _topRatedMoviesListState extends State<topRatedMoviesList> {
  final viewModel = TopRatedViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.getTopRatedMovies();
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<TopRatedViewModel, topRatedStates>(
        builder: (_, state) {
          if (state is getTopRatedMoviesLoading) {
            return LoadingIndicator();
          } else if (state is getTopRatedMoviesError) {
            return ErrorIndicator();
          } else if (state is getTopRatedMoviesSuccess) {
            return SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) =>
                    Topratedmoviesitem(state.TopRatedMovie[index]),
                itemCount: state.TopRatedMovie.length,
              ),
            );
          } else {
            return Text(
              'Failed to get ',
              style: TextStyle(color: AppTheme.white),
            );
          }
        },
      ),
    );
  }
}
