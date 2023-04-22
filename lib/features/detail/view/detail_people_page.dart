import 'package:flutter/material.dart';
import 'package:movie_app/features/detail/view/widget/detail_people.dart';
import 'package:movie_app/features/detail/view_model/people/detail_people_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/global_widget/empty_data.dart';
import '../../../core/global_widget/error.dart';
import '../../../core/utils/enum.dart';

class DetailPeoplePage extends StatefulWidget {
  const DetailPeoplePage(
      {super.key, required this.peopleId, required this.peopleName});

  final int? peopleId;
  final String? peopleName;

  @override
  State<DetailPeoplePage> createState() => _DetailPeoplePageState();
}

class _DetailPeoplePageState extends State<DetailPeoplePage> {
  @override
  void initState() {
    getDetailPeople();
    super.initState();
  }

  void getDetailPeople() {
    context.read<DetailPeopleProvider>().getDetailPeople(widget.peopleId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.peopleName ?? 'name',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        //elevation: 0,
        centerTitle: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Consumer<DetailPeopleProvider>(
            builder: (context, detailPeoplevValue, child) {
              if (detailPeoplevValue.state == ResultState.loading) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (detailPeoplevValue.state == ResultState.hasData) {
                return DetailPeople(
                    detailPeopleModel: detailPeoplevValue.detailPeopleModel);
              } else if (detailPeoplevValue.state == ResultState.noData) {
                return const EmptyData();
              } else if (detailPeoplevValue.state == ResultState.error) {
                return const ErrorData();
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
