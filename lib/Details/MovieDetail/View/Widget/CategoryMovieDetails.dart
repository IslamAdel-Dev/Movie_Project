import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_project/Details/MovieDetail/data/Models/movie_detail/genre.dart';
import 'package:movie_project/Shared/Widget/app_theme.dart';

class Categorymoviedetails extends StatelessWidget {
  final Genre movieDetails;

  const Categorymoviedetails(this.movieDetails);

  @override
  Widget build(BuildContext context) {
    print(movieDetails.name);
    return Container(
      margin: EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: AppTheme.mediumDarkGrey, width: 1),
          borderRadius: BorderRadius.circular(5)),
      child: Text(
        movieDetails.name ?? '',
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
