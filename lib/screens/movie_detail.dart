import 'package:flutter/material.dart';
import 'package:movieappyogi/constant/style.dart';
import 'package:movieappyogi/models/movie_detail_model.dart';
import 'package:movieappyogi/models/movie_overview_model.dart';
import 'package:movieappyogi/view_models/movie_view_model.dart';
import 'package:movieappyogi/widget/movie_card_widget.dart';
import 'package:provider/provider.dart';

class MovieDetail extends StatefulWidget {
  final int idMovie;
  final MovieDetailModel movieDetail;
  TranslationOverview? translate;
  MovieDetail(
      {super.key,
      required this.idMovie,
      required this.movieDetail,
      this.translate});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  void initState() {
    context
        .read<MovieViewModel>()
        .getMovieRecommendation(widget.movieDetail.id);
    context.read<MovieViewModel>().getMovieTranslate(widget.movieDetail.id);
    context.read<MovieViewModel>().getMovieSimiliar(widget.movieDetail.id);

    print(widget.movieDetail.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Stack(
          children: [
            SizedBox(
              height: 340,
              child: Image.network(
                  "https://image.tmdb.org/t/p/original/${widget.movieDetail.backdropPath}",
                  fit: BoxFit.cover),
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 320.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          widget.movieDetail.title,
                          style: textStyle.copyWith(
                              fontWeight: fwBold,
                              color: colorDarkBlue,
                              fontSize: size22),
                        ),
                        const Divider(thickness: 2),
                        Text(
                          "Overview",
                          style: textStyle.copyWith(fontWeight: fwBold),
                        ),
                        Text(
                          widget.movieDetail.overview,
                          textAlign: TextAlign.justify,
                          style: textStyle,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: TextButton(
                              onPressed: () async {
                                await showModalBottomSheet<void>(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  builder: (BuildContext context) {
                                    return Container(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Wrap(
                                        children: [
                                          Consumer<MovieViewModel>(
                                            builder: (context, value, child) {
                                              return SizedBox(
                                                  height: 150,
                                                  child: ListView.builder(
                                                    itemCount: value
                                                        .getListMovieTranslate
                                                        .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      final translate = value
                                                              .getListMovieTranslate[
                                                          index];
                                                      if (translate.englishName
                                                          .startsWith(
                                                              'ndonesian', 1)) {
                                                        return Text(
                                                          translate
                                                              .data.overview,
                                                          textAlign:
                                                              TextAlign.justify,
                                                          style: textStyle
                                                              .copyWith(
                                                                  color: Colors
                                                                      .black),
                                                        );
                                                      }
                                                      return const SizedBox();
                                                      // return Text(translate.englishName);
                                                    },
                                                  ));
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Text("Translate to Indonesian")),
                        ),
                        const Divider(thickness: 2),
                        Text(
                          "Recommedation",
                          style: textStyle.copyWith(
                              fontWeight: fwBold,
                              color: colorDarkBlue,
                              fontSize: size20),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Consumer<MovieViewModel>(
                          builder: (context, value, child) {
                            return SizedBox(
                              height: 200,
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: 10.0,
                                ),
                                scrollDirection: Axis.horizontal,
                                itemCount: value.getListRecommendation.length,
                                itemBuilder: (context, index) {
                                  final data =
                                      value.getListRecommendation[index];
                                  return MovieCard(poster: data.posterPath);
                                },
                              ),
                            );
                          },
                        ),
                        const Divider(thickness: 2),
                        Text(
                          "Similiar",
                          style: textStyle.copyWith(
                              fontWeight: fwBold,
                              color: colorDarkBlue,
                              fontSize: size20),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Consumer<MovieViewModel>(
                          builder: (context, value, child) {
                            return SizedBox(
                              height: 200,
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: 10.0,
                                ),
                                scrollDirection: Axis.horizontal,
                                itemCount: value.getListSimiliar.length,
                                itemBuilder: (context, index) {
                                  final data = value.getListSimiliar[index];
                                  return MovieCard(poster: data.posterPath);
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        )));
  }
}
