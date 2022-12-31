import 'package:flutter/material.dart';
import 'package:movieappyogi/models/movie_upcoming_model.dart';
import 'package:movieappyogi/services/movie_api_service.dart';

class MovieUpcomingViewModel extends ChangeNotifier {
  /// Upcoming MOVIE
  List<Result> _listUpcomingMovie = [];
  Result? _modelUpcomingMovie;

  List<Result> get getListUpcomingMovie => _listUpcomingMovie;
  Result? get getModelUpcomingMovie => _modelUpcomingMovie;

  getMovieUpcoming() async {
    var response = await MovieAPIService().getMovieUpcoming();
    MovieUpcomingModel modelUpcomingMovie =
        MovieUpcomingModel.fromJson(response.data);
    _listUpcomingMovie =
        (modelUpcomingMovie.results).map((e) => Result.fromJson(e)).toList();
    notifyListeners();
  }
}
