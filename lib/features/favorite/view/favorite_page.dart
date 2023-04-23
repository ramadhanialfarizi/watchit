import 'package:flutter/material.dart';
import 'package:movie_app/features/favorite/view/movie_favorite_page.dart';
import 'package:movie_app/features/favorite/view/tv_show_favorite_page.dart';

import '../../../core/global_widget/sidebar.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MovieFavoritePage(),
    TVShowFavoritePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text(
          'Favorite',
          style:
              TextStyle(color: Color(0xFFF44E42), fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
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
