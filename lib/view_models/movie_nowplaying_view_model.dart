import 'package:flutter/material.dart';
import 'package:movieappyogi/models/movie_nowplaying_model.dart';
import 'package:movieappyogi/services/movie_api_service.dart';

class MovieNowPlayingViewModel extends ChangeNotifier {
  List<Result> _listNowPlayingMovie = [];
  Result? _modelNowPlayingMovie;

  List<Result> get getListNowPlayingMovie => _listNowPlayingMovie;
  Result? get getModelNowPlayingMovie => _modelNowPlayingMovie;

  getMovieNowPlaying() async {
    var response = await MovieAPIService().getMovieNowPlaying();
    MovieNowPlayingModel modelNowPlayingMovie =
        MovieNowPlayingModel.fromJson(response.data);
    _listNowPlayingMovie =
        (modelNowPlayingMovie.results).map((e) => Result.fromJson(e)).toList();
    notifyListeners();
  }
}
