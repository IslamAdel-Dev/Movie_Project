import 'package:flutter/material.dart';
import 'package:movie_project/Search/custom_search.dart';
import 'package:movie_project/Shared/Widget/app_theme.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Scaffold(
          appBar: AppBar(
            title: const CustomSearch(),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/Icon material-local-movies.png',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'No movies found',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppTheme.white,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
