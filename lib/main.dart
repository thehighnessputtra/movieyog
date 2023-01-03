import 'package:flutter/material.dart';
import 'package:movieappyogi/screens/homepage.dart';
import 'package:movieappyogi/view_models/movie_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MovieViewModel(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: const TestingAPI(),
      ),
    );
  }
}
