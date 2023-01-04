import 'package:dio/dio.dart';

class MovieAPIService {
  final _dio = Dio();
  final url = "https://api.themoviedb.org/3";
  final apikey = "0986dc10e4ec332ba3d1aba9d2beb2af";
  final language = "en-US";

  Future getMoviePopular() async {
    try {
      Response response = await _dio.get(
          "$url/movie//popular?api_key=$apikey&language=$language&page=1&region=Id");
      // print("HASIL GET == $response");

      return response;
    } on DioError catch (e) {
      print(e.response!.statusMessage);
      print(e.response!.statusCode);
      print("error message = ${e.message}");
    }
  }

  Future getMovieNowPlaying() async {
    try {
      Response response = await _dio.get(
          "$url/movie/now_playing?api_key=$apikey&language=$language&page=1");
      // print("HASIL GET == $response");
      return response;
    } on DioError catch (e) {
      print(e.response!.statusMessage);
      print(e.response!.statusCode);
      print("error message = ${e.message}");
    }
  }

  Future getMovieUpcoming() async {
    try {
      Response response = await _dio
          .get("$url/movie/upcoming?api_key=$apikey&language=$language&page=1");
      // print("HASIL GET == ${response.data}");
      return response;
    } on DioError catch (e) {
      print(e.response!.statusMessage);
      print(e.response!.statusCode);
      print("error message = ${e.message}");
    }
  }

  Future getMovieTopRated() async {
    try {
      Response response = await _dio.get(
          "$url/movie/top_rated?api_key=$apikey&language=$language&page=1");
      // print("HASIL GET == $response");
      return response;
    } on DioError catch (e) {
      print(e.response!.statusMessage);
      print(e.response!.statusCode);
      print("error message = ${e.message}");
    }
  }

  Future getMovieRecommendations(int movieId) async {
    try {
      final response = await _dio.get(
          "$url/movie/$movieId/recommendations?api_key=$apikey&language=$language&page=1");

      // print(response);
      return response;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future getMovieTranslation(int movieId) async {
    try {
      final response =
          await _dio.get("$url/movie/$movieId/translations?api_key=$apikey");
      return response;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future getMovieSimiliar(int movieId) async {
    try {
      final response = await _dio.get(
          "$url/movie/$movieId/similar?api_key=$apikey&language=$language&page=1");

      return response;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
