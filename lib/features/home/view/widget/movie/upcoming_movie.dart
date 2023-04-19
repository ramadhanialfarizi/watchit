import 'package:flutter/material.dart';
import 'package:movie_app/features/home/model/movie/upcoming_movie_model.dart';

import '../../../../../core/utils/env.dart';
import '../../../../detail/view/detail_movie_page.dart';

class UpcomingMovie extends StatefulWidget {
  const UpcomingMovie({super.key, required this.upcomingMovieModel});

  final UpcomingMovieModel? upcomingMovieModel;

  @override
  State<UpcomingMovie> createState() => _UpcomingMovieState();
}

class _UpcomingMovieState extends State<UpcomingMovie> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.upcomingMovieModel?.results.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailMoviePage(
                        movieId: widget.upcomingMovieModel?.results[index].id)),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                      '$imageURl${widget.upcomingMovieModel?.results[index].posterPath}'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.upcomingMovieModel!.results[index].title.toString(),
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
