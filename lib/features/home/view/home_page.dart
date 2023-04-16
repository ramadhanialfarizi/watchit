import 'package:flutter/material.dart';
import 'package:movie_app/core/global_widget/sidebar.dart';
import 'package:movie_app/features/home/view/movie_list_page.dart';
import 'package:movie_app/features/home/view/tv_show_list_page.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MovieListPages(),
    TvShowListPages(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'TV Show',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFF44E42),
        onTap: _onItemTapped,
      ),
    );
  }
}
