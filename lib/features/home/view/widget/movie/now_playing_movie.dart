import 'package:flutter/material.dart';
import 'package:movie_app/features/detail/view/detail_movie_page.dart';
import 'package:movie_app/features/home/model/movie/now_playing_movie_model.dart';

import '../../../../../core/utils/env.dart';

class NowPlayingMovie extends StatefulWidget {
  const NowPlayingMovie({super.key, required this.nowPlayingMovieModel});

  final NowPlayingMovieModel? nowPlayingMovieModel;

  @override
  State<NowPlayingMovie> createState() => _NowPlayingMovieState();
}

class _NowPlayingMovieState extends State<NowPlayingMovie> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.nowPlayingMovieModel?.results?.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailMoviePage(
                        movieId:
                            widget.nowPlayingMovieModel?.results?[index].id)),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                      '$imageURl${widget.nowPlayingMovieModel?.results?[index].posterPath}'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '${widget.nowPlayingMovieModel?.results?[index].title}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
