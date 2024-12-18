import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_project/Shared/Widget/app_theme.dart';
import 'package:movie_project/Shared/Widget/error_indicator.dart';
import 'package:movie_project/Shared/Widget/loading_indicator.dart';
import 'package:movie_project/newReleaseMovies/view/Widget/new_releases_movies_Item.dart';
import 'package:movie_project/newReleaseMovies/viewModel/new_releases__view_model.dart';
import 'package:movie_project/newReleaseMovies/viewModel/new_releases_states.dart';

class NewReleasesReatedMovieslist extends StatelessWidget {
  final viewModel = NewReleasesViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.getNewReleasesMovies();
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<NewReleasesViewModel, NewReleasesStates>(
        builder: (_, state) {
          if (state is getNewReleasesMoviesLoading) {
            return LoadingIndicator();
          } else if (state is getNewReleasesMoviesError) {
            return ErrorIndicator();
          } else if (state is getNewReleasesMoviesSuccess) {
            return SizedBox(
              height: 180,
              child: ListView.separated(
                separatorBuilder: (_, __) => SizedBox(
                  width: 10,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) =>
                    NewReleasesMoviesItem(state.newReleases[index]),
                itemCount: state.newReleases.length,
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
