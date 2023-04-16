import 'package:flutter/material.dart';

import '../../../core/global_widget/sidebar.dart';

class TvShowListPages extends StatefulWidget {
  const TvShowListPages({super.key});

  @override
  State<TvShowListPages> createState() => _TvShowListPagesState();
}

class _TvShowListPagesState extends State<TvShowListPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text(
          'TV Show',
          style:
              TextStyle(color: Color(0xFFF44E42), fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
