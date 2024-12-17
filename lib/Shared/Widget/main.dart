import 'package:flutter/material.dart';
import 'package:movies_app/app_theme.dart';
import 'package:movies_app/screens/intro_page_screen.dart';
import 'package:movies_app/tabs/Details/MovieDetail/View/Widget/movieDetail_View.dart';
import 'package:movies_app/widgets/splash_screen.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        IntroPageScreen.routeName: (_) => const IntroPageScreen(),
        MoviedetailView.routeName: (_) => MoviedetailView(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
