import 'package:flutter/material.dart';
import 'package:movie_project/Details/MovieDetail/View/Widget/movieDetail_View.dart';
import 'package:movie_project/Shared/Api/api.dart';
import 'package:movie_project/Shared/Widget/app_theme.dart';

class MoviesListScreen extends StatelessWidget {
  final int genreId;
  final String genreName;

  const MoviesListScreen({
    super.key,
    required this.genreId,
    required this.genreName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          genreName,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppTheme.white,
              ),
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchMoviesByGenre(genreId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppTheme.white,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No movies available',
              ),
            );
          }

          final movies = snapshot.data!;
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              print(movie);

              final releaseDate = movie['release_date'] ?? 'Unknown';

              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                    MoviedetailView.routeName,
                    arguments: movie['id']),
                child: ListTile(
                  title: Text(
                    movie['title'],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.white,
                        ),
                  ),
                  subtitle: Text(
                    'Release Date: $releaseDate',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppTheme.white.withOpacity(0.67),
                        ),
                  ),
                  leading: Image.network(
                    movie['backdrop_path'] != null
                        ? 'https://image.tmdb.org/t/p/original${movie['backdrop_path']}'
                        : 'https://st.depositphotos.com/1987177/3470/v/450/depositphotos_34700099-stock-illustration-no-photo-available-or-missing.jpg',
                    fit: BoxFit.cover,
                    width: 50,
                    height: 75,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
