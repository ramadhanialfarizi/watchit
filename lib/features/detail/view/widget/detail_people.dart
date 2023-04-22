import 'package:flutter/material.dart';
import 'package:movie_app/core/global_widget/empty_data.dart';
import 'package:movie_app/core/global_widget/line.dart';
import 'package:movie_app/features/detail/model/people/detail_people_model.dart';
import 'package:movie_app/features/detail/view/widget/more_people.dart';
import 'package:movie_app/features/detail/view_model/people/detail_people_provider.dart';
import 'package:movie_app/features/people/view_model/people_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/global_widget/error.dart';
import '../../../../core/utils/enum.dart';
import '../../../../core/utils/env.dart';
import '../../view_model/tv_show/detail_tv_show_provider.dart';

class DetailPeople extends StatefulWidget {
  const DetailPeople({super.key, required this.detailPeopleModel});

  final DetailPeopleModel? detailPeopleModel;

  @override
  State<DetailPeople> createState() => _DetailPeopleState();
}

class _DetailPeopleState extends State<DetailPeople> {
  @override
  void initState() {
    getMorePeople();
    super.initState();
  }

  void getMorePeople() {
    context.read<DetailPeopleProvider>().getMorePeople();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                        '$imageURl${widget.detailPeopleModel?.profilePath}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.detailPeopleModel?.popularity.toString() ?? '',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text('Popularity')
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.detailPeopleModel?.knownForDepartment ?? '',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Department')
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.detailPeopleModel?.name ?? '',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.calendar_month_rounded,
                color: Color(0xFFF44E42),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                widget.detailPeopleModel?.birthday.toString() ?? '',
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.start,
              ),
            ],
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
            widget.detailPeopleModel!.biography ?? 'no have overview',
            style: const TextStyle(fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 20,
          ),
          const Line(),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'More People for you',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const SizedBox(
            height: 16,
          ),
          Consumer<DetailPeopleProvider>(
            builder: (context, morePeopleValue, child) {
              if (morePeopleValue.state == ResultState.loading) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 5.3,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (morePeopleValue.state == ResultState.hasData) {
                return MorePeople(
                    morePeopleModel: morePeopleValue.morePeopleModel);
              } else if (morePeopleValue.state == ResultState.noData) {
                return const EmptyData();
              } else {
                return const ErrorData();
              }
            },
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
