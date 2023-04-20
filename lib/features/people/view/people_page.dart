import 'package:flutter/material.dart';
import 'package:movie_app/features/people/view/widget/popular_people.dart';
import 'package:movie_app/features/people/view/widget/top_actor.dart';
import 'package:movie_app/features/people/view_model/people_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/global_widget/empty_data.dart';
import '../../../core/global_widget/error.dart';
import '../../../core/global_widget/sidebar.dart';
import '../../../core/utils/enum.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({super.key});

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  @override
  void initState() {
    getPopularPeople();
    super.initState();
  }

  void getPopularPeople() {
    context.read<PeopleProvider>().getPopularPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text(
          'People',
          style:
              TextStyle(color: Color(0xFFF44E42), fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Top Actors',
                style: TextStyle(
                    color: Color(0xFFF44E42),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Consumer<PeopleProvider>(
                builder: (context, topPeopleValue, child) {
                  if (topPeopleValue.state == ResultState.loading) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 5.3,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (topPeopleValue.state == ResultState.hasData) {
                    return TopActors(
                        popularPeopleModel: topPeopleValue.popularPeopleModel);
                  } else if (topPeopleValue.state == ResultState.noData) {
                    return const EmptyData();
                  } else {
                    return const ErrorData();
                  }
                },
              ),
              const SizedBox(
                height: 56,
              ),
              const Text(
                'Popular',
                style: TextStyle(
                    color: Color(0xFFF44E42),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Consumer<PeopleProvider>(
                builder: (context, peoplePopularValue, child) {
                  if (peoplePopularValue.state == ResultState.loading) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 5.3,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (peoplePopularValue.state == ResultState.hasData) {
                    return PopularPeople(
                        popularPeopleModel:
                            peoplePopularValue.popularPeopleModel);
                  } else if (peoplePopularValue.state == ResultState.noData) {
                    return const EmptyData();
                  } else {
                    return const ErrorData();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
