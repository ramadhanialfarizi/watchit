import 'package:flutter/material.dart';
import 'package:movie_app/features/detail/model/people/more_people_model.dart';

import '../../../../core/utils/env.dart';
import '../detail_people_page.dart';

class MorePeople extends StatefulWidget {
  const MorePeople({super.key, required this.morePeopleModel});

  final MorePeopleModel? morePeopleModel;

  @override
  State<MorePeople> createState() => _MorePeopleState();
}

class _MorePeopleState extends State<MorePeople> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.morePeopleModel?.results?.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPeoplePage(
                          peopleId: widget.morePeopleModel?.results?[index].id,
                          peopleName:
                              widget.morePeopleModel?.results?[index].name,
                        )),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              width: 150,
              //height: 67,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                      '$imageURl${widget.morePeopleModel?.results?[index].profilePath}'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${widget.morePeopleModel?.results?[index].name}',
                      style: const TextStyle(
                        color: Color(0xFFF44E42),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
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
