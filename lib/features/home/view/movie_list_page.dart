import 'package:flutter/material.dart';

import '../../../core/global_widget/sidebar.dart';

class MovieListPages extends StatefulWidget {
  const MovieListPages({super.key});

  @override
  State<MovieListPages> createState() => _MovieListPagesState();
}

class _MovieListPagesState extends State<MovieListPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text(
          'Movie',
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
