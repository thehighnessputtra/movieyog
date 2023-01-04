import 'package:flutter/material.dart';
import 'package:movieappyogi/screens/movie_detail.dart';
import 'package:movieappyogi/view_models/movie_view_model.dart';
import 'package:movieappyogi/widget/movie_card_widget.dart';
import 'package:movieappyogi/widget/navigator_transition.dart';
import 'package:provider/provider.dart';

class TestingAPI extends StatefulWidget {
  const TestingAPI({super.key});

  @override
  State<TestingAPI> createState() => _TestingAPIState();
}

class _TestingAPIState extends State<TestingAPI> {
  @override
  void initState() {
    context.read<MovieViewModel>().getMoviePopular();
    context.read<MovieViewModel>().getMovieNowPlaying();
    context.read<MovieViewModel>().getMovieTopRated();
    context.read<MovieViewModel>().getMovieUpcoming();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("MOVIEYUG"),
        ),
        body: Consumer<MovieViewModel>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              physics: const BouncingScrollPhysics(),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "POPULAR",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        height: 200,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10.0,
                          ),
                          itemCount: value.getListPopularMovie.length,
                          itemBuilder: (context, index) {
                            final moviePopular =
                                value.getListPopularMovie.elementAt(index);
                            return GestureDetector(
                                onTap: () {
                                  navPushTransition(
                                      context,
                                      MovieDetail(
                                          // translate: ,
                                          idMovie: moviePopular.id,
                                          movieDetail: moviePopular));
                                },
                                child:
                                    MovieCard(poster: moviePopular.posterPath));
                          },
                        )),
                    const Text(
                      "NOW PLAYING",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        height: 200,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10.0,
                          ),
                          itemCount: value.getListPopularMovie.length,
                          itemBuilder: (context, index) {
                            final movieNowPlaying =
                                value.getListNowPlaying.elementAt(index);

                            return GestureDetector(
                                onTap: () {
                                  navPushTransition(
                                      context,
                                      MovieDetail(
                                          idMovie: movieNowPlaying.id,
                                          movieDetail: movieNowPlaying));
                                },
                                child: MovieCard(
                                    poster: movieNowPlaying.posterPath));
                          },
                        )),
                    const Text(
                      "TOP RATED",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        height: 200,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10.0,
                          ),
                          itemCount: value.getListTopRated.length,
                          itemBuilder: (context, index) {
                            final movieTopRated =
                                value.getListTopRated.elementAt(index);

                            return GestureDetector(
                                onTap: () {
                                  navPushTransition(
                                      context,
                                      MovieDetail(
                                          idMovie: movieTopRated.id,
                                          movieDetail: movieTopRated));
                                },
                                child: MovieCard(
                                    poster: movieTopRated.posterPath));
                          },
                        )),
                    const Text(
                      "UPCOMING",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        height: 200,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10.0,
                          ),
                          itemCount: value.getListUpcoming.length,
                          itemBuilder: (context, index) {
                            final movieUpcoming =
                                value.getListUpcoming.elementAt(index);

                            return GestureDetector(
                                onTap: () {
                                  navPushTransition(
                                      context,
                                      MovieDetail(
                                          idMovie: movieUpcoming.id,
                                          movieDetail: movieUpcoming));
                                },
                                child: MovieCard(
                                    poster: movieUpcoming.posterPath));
                          },
                        )),
                  ]),
            );
          },
        ));
  }
}
