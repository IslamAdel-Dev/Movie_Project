import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_project/newReleaseMovies/Repository/new_releses_movies_repository.dart';
import 'package:movie_project/newReleaseMovies/viewModel/new_releases_states.dart';

class NewReleasesViewModel extends Cubit<NewReleasesStates> {
  final repository = NewRelesesMoviesRepository();

  NewReleasesViewModel() : super(NewReleasesInit());

  Future<void> getNewReleasesMovies() async {
    emit(getNewReleasesMoviesLoading());

    try {
      final newreleases = await repository.getNewReleasesMovies();
      emit(getNewReleasesMoviesSuccess(newreleases));
    } catch (error) {
      emit(getNewReleasesMoviesError(error.toString()));
    }
  }
}
