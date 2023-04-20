import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/env.dart';
import 'package:movie_app/features/people/model/popular_people_model.dart';

class PopularPeople extends StatefulWidget {
  const PopularPeople({super.key, required this.popularPeopleModel});

  final PopularPeopleModel? popularPeopleModel;

  @override
  State<PopularPeople> createState() => _PopularPeopleState();
}

class _PopularPeopleState extends State<PopularPeople> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        mainAxisExtent: 256,
      ),
      //scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.popularPeopleModel?.results?.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => DetailMoviePage(
            //           movieId:
            //               widget.popularPeopleModel?.results?[index].id)),
            // );
          },
          child: Container(
            //margin: const EdgeInsets.only(right: 12),
            width: 150,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(
                    '$imageURl${widget.popularPeopleModel?.results?[index].profilePath}'),
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
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Color.fromARGB(255, 255, 221, 221),
                  //       blurRadius: 8,
                  //       //offset: Offset(4, 8),
                  //       spreadRadius: 0.5),
                  // ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${widget.popularPeopleModel?.results?[index].name}',
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
    );
  }
}
