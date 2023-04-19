import 'package:flutter/material.dart';
import 'package:movie_app/core/global_widget/line.dart';
import 'package:movie_app/core/utils/env.dart';
import 'package:movie_app/features/detail/model/movie/detail_movie_model.dart';

class DetailMovie extends StatefulWidget {
  const DetailMovie({super.key, required this.detailMovieModel});

  final DetailMovieModel? detailMovieModel;

  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)),
          child: Stack(
            children: [
              Image.network('$imageURl${widget.detailMovieModel?.posterPath}'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.detailMovieModel!.originalTitle}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: widget.detailMovieModel?.genres.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFFF44E42),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          widget.detailMovieModel!.genres[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Line(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Overview',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                widget.detailMovieModel!.overview,
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 20,
              ),
              const Line(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Popularity',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              const SizedBox(
                height: 1,
              ),
              ListTile(
                leading: const Icon(
                  Icons.people_alt,
                  color: Color(0xFFF44E42),
                ),
                title: Text(
                  widget.detailMovieModel!.popularity.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              const Line(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Language',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: widget.detailMovieModel?.spokenLanguages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFFF44E42),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          widget.detailMovieModel!.spokenLanguages[index]
                              .englishName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Line(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Producer',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount:
                      widget.detailMovieModel?.productionCompanies.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        // border: Border.all(
                        //     width: 0.6, color: const Color(0xFFF44E42)),
                        image: DecorationImage(
                          image: NetworkImage(
                              '$imageURl${widget.detailMovieModel!.productionCompanies[index].logoPath}'),
                          //fit: BoxFit.cover,
                        ),
                      ),
                      child: const SizedBox(
                        width: 100,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // const Line(),
              // const SizedBox(
              //   height: 20,
              // ),
              // const Text(
              //   'Homepage',
              //   style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
