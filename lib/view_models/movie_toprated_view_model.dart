import 'package:flutter/material.dart';
import 'package:movieappyogi/models/movie_toprated_model.dart';
import 'package:movieappyogi/services/movie_api_service.dart';

class MovieTopRatedViewModel extends ChangeNotifier {
  /// TopRated MOVIE
  List<Result> _listTopRatedMovie = [];
  Result? _modelTopRatedMovie;

  List<Result> get getListTopRatedMovie => _listTopRatedMovie;
  Result? get getModelTopRatedMovie => _modelTopRatedMovie;

  getMovieTopRated() async {
    var response = await MovieAPIService().getMovieTopRated();
    MovieTopRatedModel modelTopRatedMovie =
        MovieTopRatedModel.fromJson(response.data);
    _listTopRatedMovie =
        (modelTopRatedMovie.results).map((e) => Result.fromJson(e)).toList();
    notifyListeners();
  }
}
