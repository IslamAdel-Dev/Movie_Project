import 'package:flutter/material.dart';
import 'package:movie_project/Search/view/widgets/searched_films.dart';
import 'package:movie_project/Shared/Widget/app_theme.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController search = TextEditingController();
  String searchQuery = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppTheme.mediumDarkGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child:  TextField(
                controller: search,
                onChanged: (value) => setState(() {
                  searchQuery = value;
                }),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
            color: AppTheme.white,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppTheme.white,
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if
                 (searchQuery.isNotEmpty)
                    SearchedFilms(movieName: searchQuery)
               /* else
                
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
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
