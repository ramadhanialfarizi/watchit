import 'package:flutter/material.dart';
import 'package:movie_app/features/home/model/tv_show/top_rated_model.dart';

import '../../../../../core/utils/env.dart';

class TopRatedTvShow extends StatefulWidget {
  const TopRatedTvShow({super.key, required this.topRatedTvShowModel});

  final TopRatedTvShowModel? topRatedTvShowModel;

  @override
  State<TopRatedTvShow> createState() => _TopRatedTvShowState();
}

class _TopRatedTvShowState extends State<TopRatedTvShow> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.topRatedTvShowModel!.results.length,
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
                      '${imageURl}${widget.topRatedTvShowModel!.results[index].posterPath}'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '${widget.topRatedTvShowModel!.results[index].name}',
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
