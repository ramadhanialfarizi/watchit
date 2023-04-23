import 'package:flutter/material.dart';

class EmptyFavorite extends StatelessWidget {
  const EmptyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, left: 25, right: 25),
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset(
            'assets/images/empty_data.png',
            scale: 3,
          ),
          const SizedBox(
            height: 26,
          ),
          const Text(
            'you dont have a favorite list here, please add one',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
