import 'package:flutter/material.dart';
import 'package:movie_project/Catagory/custom_browser.dart';
import 'package:movie_project/Catagory/data/Models/movie_catagory/movie_catagory.dart';
import 'package:movie_project/Catagory/data/genre_api.dart';
import 'package:movie_project/Catagory/movie_list_screen.dart';
import 'package:movie_project/Details/MovieDetail/View/Widget/movieDetail_View.dart';
import 'package:movie_project/Details/MovieDetail/data/Models/movie_detail/movie_detail.dart';
import 'package:movie_project/Shared/Widget/app_theme.dart';
import 'package:movie_project/Shared/Widget/error_indicator.dart';
import 'package:movie_project/Shared/Widget/loading_indicator.dart';

class BrowserTab extends StatelessWidget {
  const BrowserTab({super.key});
  static const String routeName = 'browser';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Browse Category',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppTheme.white,
                  ),
            ),
            const SizedBox(height: 10),
            FutureBuilder<MovieCatagory>(
              future: fetchGenres(),
              builder: (context, snapshot) {
                print(snapshot.error);
                print(snapshot.data);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingIndicator();
                } else if (snapshot.hasError) {
                  return const ErrorIndicator();
                } else if (!snapshot.hasData ||
                    snapshot.data!.genres!.isEmpty) {
                  return const Center(
                    child: Text(
                      'No categories available',
                    ),
                  );
                }
                final genres = snapshot.data!.genres!;
                return Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: genres.length,
                    itemBuilder: (context, index) {
                      final genre = genres[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MoviesListScreen(
                                genreId: genre.id,
                                genreName: genre.name,
                              ),
                            ),
                          );
                        },
                        child: CustomBrowser(
                          title: genre.name ?? 'Unknown',
                          imageUrl: 'assets/images/action.png',
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
