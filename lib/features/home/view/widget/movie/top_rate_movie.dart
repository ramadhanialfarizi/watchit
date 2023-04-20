import 'package:flutter/material.dart';

import 'package:movie_app/core/utils/env.dart';
import 'package:movie_app/features/home/model/movie/top_rate_movie_model.dart';

import '../../../../detail/view/detail_movie_page.dart';

class TopRateMovie extends StatefulWidget {
  const TopRateMovie({super.key, this.topRateMovieModel});

  final TopRateMovieModel? topRateMovieModel;

  @override
  State<TopRateMovie> createState() => _TopRateMovieState();
}

class _TopRateMovieState extends State<TopRateMovie> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.topRateMovieModel?.results?.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailMoviePage(
                        movieId: widget.topRateMovieModel?.results?[index].id)),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                      '${imageURl}${widget.topRateMovieModel?.results?[index].posterPath}'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '${widget.topRateMovieModel?.results?[index].title}',
                  style: TextStyle(
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
