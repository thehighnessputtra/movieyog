import 'package:flutter/material.dart';
import 'package:movieappyogi/models/movie_detail_model.dart';

class MovieDetail extends StatefulWidget {
  final int idMovie;
  final MovieDetailModel movieDetail;
  const MovieDetail(
      {super.key, required this.idMovie, required this.movieDetail});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(widget.movieDetail.title),
          Text(widget.movieDetail.overview),
          Text(widget.movieDetail.originalTitle),
        ],
      ),
    );
  }
}
