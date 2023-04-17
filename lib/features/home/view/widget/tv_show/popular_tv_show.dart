import 'package:flutter/material.dart';
import 'package:movie_app/features/home/model/tv_show/popular_tv_show_model.dart';

import '../../../../../core/utils/env.dart';

class PopularTvShow extends StatefulWidget {
  const PopularTvShow({super.key, required this.popularTvShowModel});

  final PopularTvShowModel? popularTvShowModel;

  @override
  State<PopularTvShow> createState() => _PopularTvShowState();
}

class _PopularTvShowState extends State<PopularTvShow> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.popularTvShowModel!.results.length,
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
                      '${imageURl}${widget.popularTvShowModel!.results[index].posterPath}'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '${widget.popularTvShowModel!.results[index].name}',
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
