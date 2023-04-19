import 'package:flutter/material.dart';
import 'package:movie_app/core/global_widget/empty_data.dart';
import 'package:movie_app/core/global_widget/error.dart';
import 'package:movie_app/core/utils/enum.dart';
import 'package:movie_app/features/detail/view/widget/detail_tv_show.dart';
import 'package:movie_app/features/detail/view_model/tv_show/detail_tv_show_provider.dart';
import 'package:movie_app/features/home/view_model/tv_show/tv_show_provider.dart';
import 'package:provider/provider.dart';

class DetailTvShowPage extends StatefulWidget {
  const DetailTvShowPage({super.key, required this.tvId});

  final int? tvId;

  @override
  State<DetailTvShowPage> createState() => _DetailTvShowPageState();
}

class _DetailTvShowPageState extends State<DetailTvShowPage> {
  @override
  void initState() {
    getDetailTvShow();
    super.initState();
  }

  void getDetailTvShow() {
    context.read<DetailTvShowProvider>().getDetailTvShow(widget.tvId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Consumer<DetailTvShowProvider>(
            builder: (context, detailTvShowValue, child) {
              if (detailTvShowValue.state == ResultState.loading) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 1,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (detailTvShowValue.state == ResultState.hasData) {
                return DetailTvShow(
                    detailTvShowModel: detailTvShowValue.detailTvShowModel);
              } else if (detailTvShowValue.state == ResultState.noData) {
                return const EmptyData();
              } else if (detailTvShowValue.state == ResultState.error) {
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
