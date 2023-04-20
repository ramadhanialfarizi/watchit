import 'package:flutter/material.dart';
import 'package:movie_app/features/home/model/tv_show/on_the_air_model.dart';

import '../../../../../core/utils/env.dart';
import '../../../../detail/view/detail_tv_show_page.dart';

class OnTheAirTvShow extends StatefulWidget {
  const OnTheAirTvShow({super.key, required this.onTheAirModel});

  final OnTheAirModel? onTheAirModel;

  @override
  State<OnTheAirTvShow> createState() => _OnTheAirTvShowState();
}

class _OnTheAirTvShowState extends State<OnTheAirTvShow> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.onTheAirModel?.results?.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailTvShowPage(
                          tvId: widget.onTheAirModel?.results?[index].id)));
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                      '${imageURl}${widget.onTheAirModel?.results?[index].posterPath}'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '${widget.onTheAirModel?.results?[index].name}',
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
