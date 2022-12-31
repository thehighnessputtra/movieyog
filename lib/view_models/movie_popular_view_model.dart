import 'package:flutter/material.dart';
import 'package:movieappyogi/services/movie_api_service.dart';
import 'package:movieappyogi/models/movie_popular_model.dart';

class MoviePopularViewModel extends ChangeNotifier {
  /// POPULAR MOVIE
  List<PopularMovieData> _listPopularMovie = [];
  PopularMovieData? _modelPopularMovie;

  List<PopularMovieData> get getListPopularMovie => _listPopularMovie;
  PopularMovieData? get getModelPopularMovie => _modelPopularMovie;

  getMoviePopular() async {
    var response = await MovieAPIService().getMoviePopular();
    MoviePopularModel modelPopularMovie =
        MoviePopularModel.fromJson(response.data);
    _listPopularMovie = (modelPopularMovie.results)
        .map((e) => PopularMovieData.fromJson(e))
        .toList();
    notifyListeners();
  }
}
