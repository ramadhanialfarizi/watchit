import 'package:flutter/material.dart';
import 'package:movie_app/features/detail/view/detail_tv_show_page.dart';
import 'package:movie_app/features/home/model/tv_show/airing_today_model.dart';

import '../../../../../core/utils/env.dart';

class AiringTodayTvShow extends StatefulWidget {
  const AiringTodayTvShow({super.key, required this.airingTodayModel});

  final AiringTodayModel? airingTodayModel;

  @override
  State<AiringTodayTvShow> createState() => _AiringTodayTvShowState();
}

class _AiringTodayTvShowState extends State<AiringTodayTvShow> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.airingTodayModel?.results?.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailTvShowPage(
                          tvId: widget.airingTodayModel?.results?[index].id)));
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                      '$imageURl${widget.airingTodayModel?.results?[index].posterPath}'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '${widget.airingTodayModel?.results?[index].name}',
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
