import 'package:flutter/material.dart';
import 'package:movie_app/features/detail/view/detail_tv_show_page.dart';
import 'package:movie_app/features/favorite/view/widget/empty_favorite.dart';
import 'package:provider/provider.dart';

import '../../../core/global_widget/empty_data.dart';
import '../../../core/global_widget/error.dart';
import '../../../core/utils/env.dart';
import '../view_model/favorite_provider.dart';

class TVShowFavoritePage extends StatefulWidget {
  const TVShowFavoritePage({super.key});

  @override
  State<TVShowFavoritePage> createState() => _TVShowFavoritePageState();
}

class _TVShowFavoritePageState extends State<TVShowFavoritePage> {
  final String? type = 'tvshow';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Consumer<FavoriteProvider>(
          builder: (context, serviceValue, child) {
            return StreamBuilder(
              stream: serviceValue.getFavoriteData(type),
              builder: (context, snapshot) {
                // if (snapshot.data == null) {
                //   return const EmptyFavorite();
                // }
                if (snapshot.hasError) {
                  return const ErrorData();
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 5.3,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      mainAxisExtent: 180,
                    ),
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      final item = snapshot.data!.docs[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailTvShowPage(tvId: item['id']),
                            ),
                          );
                        },
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image:
                                  NetworkImage('$imageURl${item['imagePath']}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '''${item['title']}''',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return const EmptyData();
              },
            );
          },
        ),
      ),
    );
  }
}
