import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  String? poster;

  MovieCard({required this.poster, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 140,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage("https://image.tmdb.org/t/p/original/$poster")),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      // child: Column(
      //   children: [
      //     Container(
      //       margin: const EdgeInsets.only(top: 165),
      //       width: double.infinity,
      //       height: 25,
      //       decoration: const BoxDecoration(
      //           color: Colors.white38),
      //       child: Center(
      //         child: Text(
      //           maxLines: 1,
      //           movieNowPlaying.title,
      //           style: TextStyle(
      //               fontWeight: FontWeight.w700,
      //               fontSize: 16),
      //           textAlign: TextAlign.center,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
