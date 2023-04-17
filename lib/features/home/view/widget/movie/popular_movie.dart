import 'package:flutter/material.dart';
import 'package:movie_app/features/home/model/movie/popular_movie_model.dart';

import '../../../../../core/utils/env.dart';

class PopularMovie extends StatefulWidget {
  const PopularMovie({super.key, this.popularMovieModel});

  final PopularMovieModel? popularMovieModel;

  @override
  State<PopularMovie> createState() => _PopularMovieState();
}

class _PopularMovieState extends State<PopularMovie> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.popularMovieModel?.results.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                      '$imageURl${widget.popularMovieModel?.results[index].posterPath}'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '${widget.popularMovieModel?.results[index].title}',
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
