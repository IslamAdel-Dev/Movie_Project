import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_project/Details/MovieDetail/View/Widget/movieDetail_View.dart';
import 'package:movie_project/carousel/data/data_sources/sources_data_source.dart';
import 'package:movie_project/carousel/data/models/source.dart';
import 'package:movie_project/carousel/data/models/source_response.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({super.key});

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late Future<SourceResponse> moviesFuture;

  @override
  void initState() {
    super.initState();
    moviesFuture = SourcesDataSource.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder<SourceResponse>(
      future: moviesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.results == null) {
          return Center(child: Text('No movies found.'));
        }

        final movies = snapshot.data!.results!;
        return CarouselSlider.builder(
          itemCount: movies.length,
          itemBuilder: (context, index, realIndex) {
            final Source movie = movies[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
            .pushNamed(MoviedetailView.routeName, arguments: movie.id);
              },
              child: Stack(
                children: [
                  // Background image
                  CachedNetworkImage(
                    imageUrl:
                        "https://image.tmdb.org/t/p/w500${movie.backdropPath}",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),

                  // Movie details
                  Positioned(
                    bottom: 0,
                    child: Container(
                      color: Colors.black,
                      width: width,
                      height: height * 0.10,
                      child: Container(
                        color: Colors.transparent,
                        margin: EdgeInsets.only(left: width * 0.37),
                        child: Text(
                          movie.title ?? "Unknown Title",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Movie poster
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                      width: 100,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            );
          },
          options: CarouselOptions(
            height: height * 0.5, // Adjust the height as needed
            viewportFraction: 1.0, // To show full-width items
            enlargeCenterPage: true, // Optional: to highlight the centered item
            autoPlay: true, // Optional: to enable auto scrolling
            autoPlayInterval: Duration(seconds: 5), // Auto scroll interval
          ),
        );
      },
    );
  }
  }
