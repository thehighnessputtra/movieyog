import 'package:flutter/material.dart';
import 'package:movieappyogi/screens/homepage.dart';
import 'package:movieappyogi/view_models/movie_nowplaying_view_model.dart';
import 'package:movieappyogi/view_models/movie_popular_view_model.dart';
import 'package:movieappyogi/view_models/movie_toprated_view_model.dart';
import 'package:movieappyogi/view_models/movie_upcoming_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MoviePopularViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieNowPlayingViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieUpcomingViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieTopRatedViewModel(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: const TestingAPI(),
      ),
    );
  }
}
