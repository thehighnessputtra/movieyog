import 'package:flutter/material.dart';
import 'package:movieappyogi/view_models/movie_nowplaying_view_model.dart';
import 'package:movieappyogi/view_models/movie_popular_view_model.dart';
import 'package:movieappyogi/view_models/movie_toprated_view_model.dart';
import 'package:movieappyogi/view_models/movie_upcoming_view_model.dart';
import 'package:provider/provider.dart';

class TestingAPI extends StatefulWidget {
  const TestingAPI({super.key});

  @override
  State<TestingAPI> createState() => _TestingAPIState();
}

class _TestingAPIState extends State<TestingAPI> {
  @override
  void initState() {
    context.read<MoviePopularViewModel>().getMoviePopular();
    context.read<MovieNowPlayingViewModel>().getMovieNowPlaying();
    context.read<MovieUpcomingViewModel>().getMovieUpcoming();
    context.read<MovieTopRatedViewModel>().getMovieTopRated();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("MOVIEYOG"),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "POPULAR",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Consumer<MoviePopularViewModel>(
                    builder: (context, value, child) {
                      return SizedBox(
                          height: 100,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 10.0,
                            ),
                            itemCount: value.getListPopularMovie.length,
                            itemBuilder: (context, index) {
                              final dataPopularMovie =
                                  value.getListPopularMovie[index];
                              return Container(
                                height: 100,
                                width: 80,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.amber),
                                child: Text(dataPopularMovie.title),
                              );
                            },
                          ));
                    },
                  ),
                  const Text(
                    "NOW PLAYING",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Consumer<MovieNowPlayingViewModel>(
                      builder: (context, value, child) {
                    return SizedBox(
                      height: 100,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10.0,
                        ),
                        itemCount: value.getListNowPlayingMovie.length,
                        itemBuilder: (context, index) {
                          final dataNowPlayingMovie =
                              value.getListNowPlayingMovie[index];
                          return Container(
                            height: 100,
                            width: 80,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.amber),
                            child: Text(dataNowPlayingMovie.title),
                          );
                        },
                      ),
                    );
                  }),
                  const Text(
                    "UPCOMING",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Consumer<MovieUpcomingViewModel>(
                      builder: (context, value, child) {
                    return SizedBox(
                      height: 100,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10.0,
                        ),
                        itemCount: value.getListUpcomingMovie.length,
                        itemBuilder: (context, index) {
                          final dataUpcomingMovie =
                              value.getListUpcomingMovie[index];
                          return Container(
                            height: 100,
                            width: 80,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.amber),
                            child: Text(dataUpcomingMovie.title),
                          );
                        },
                      ),
                    );
                  }),
                  const Text(
                    "TOP RATED",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Consumer<MovieTopRatedViewModel>(
                      builder: (context, value, child) {
                    return SizedBox(
                      height: 100,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10.0,
                        ),
                        itemCount: value.getListTopRatedMovie.length,
                        itemBuilder: (context, index) {
                          final dataTopRatedMovie =
                              value.getListTopRatedMovie[index];
                          return Container(
                            height: 100,
                            width: 80,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.amber),
                            child: Text(dataTopRatedMovie.title),
                          );
                        },
                      ),
                    );
                  }),
                ])));
  }
}
