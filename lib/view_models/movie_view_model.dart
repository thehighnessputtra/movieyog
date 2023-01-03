import 'package:flutter/material.dart';
import 'package:movieappyogi/models/movie_detail_model.dart';
import 'package:movieappyogi/services/movie_api_service.dart';

class MovieViewModel extends ChangeNotifier {
  List<MovieDetailModel> _listPopularMovie = [];
  List<MovieDetailModel> get getListPopularMovie => _listPopularMovie;

  List<MovieDetailModel> _listNowPlaying = [];
  List<MovieDetailModel> get getListNowPlaying => _listNowPlaying;

  List<MovieDetailModel> _listUpcoming = [];
  List<MovieDetailModel> get getListUpcoming => _listUpcoming;

  List<MovieDetailModel> _listTopRated = [];
  List<MovieDetailModel> get getListTopRated => _listTopRated;

  MovieDetailModel? _modelPopularMovie;
  MovieDetailModel? get getModelPopularMovie => _modelPopularMovie;

  getMoviePopular() async {
    var response = await MovieAPIService().getMoviePopular();
    var movie = response.data['results'] as List;
    List<MovieDetailModel> movieList =
        movie.map((e) => MovieDetailModel.fromJson(e)).toList();
    _listPopularMovie = movieList;
    notifyListeners();
  }

  getMovieNowPlaying() async {
    var response = await MovieAPIService().getMovieNowPlaying();
    var movie = response.data['results'] as List;
    List<MovieDetailModel> movieList =
        movie.map((e) => MovieDetailModel.fromJson(e)).toList();
    _listNowPlaying = movieList;
    notifyListeners();
  }

  getMovieTopRated() async {
    var response = await MovieAPIService().getMovieTopRated();
    var movie = response.data['results'] as List;
    List<MovieDetailModel> movieList =
        movie.map((e) => MovieDetailModel.fromJson(e)).toList();
    _listTopRated = movieList;
    notifyListeners();
  }

  getMovieUpcoming() async {
    var response = await MovieAPIService().getMovieUpcoming();
    var movie = response.data['results'] as List;
    List<MovieDetailModel> movieList =
        movie.map((e) => MovieDetailModel.fromJson(e)).toList();
    _listUpcoming = movieList;
    notifyListeners();
  }
}
