import 'package:flutter/material.dart';
import 'package:movies_app/app_theme.dart';
import 'package:movies_app/widgets/custom_search.dart';

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
