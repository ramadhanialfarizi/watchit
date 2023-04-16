import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/authentication_helper.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  final userEmail = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Welcome...',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            // USER EMAIL
            accountEmail: Text(
              '${userEmail.currentUser!.email}',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/movie_bg.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Color(0xFFF44E42),
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                //color: Color(0xFFF44E42),
              ),
            ),
            onTap: () {
              // Update the state of the app.
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.favorite,
              color: Color(0xFFF44E42),
            ),
            title: const Text(
              'Favorite',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                //color: Color(0xFFF44E42),
              ),
            ),
            onTap: () {
              // Update the state of the app.
              //Navigator.of(context).pushReplacementNamed('/favorite');
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.account_circle, color: Colors.white),
              label: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xFFF44E42),
                ),
              ),
              onPressed: () async {
                await AuthHelper().signOut();

                Navigator.of(context).pushReplacementNamed('/signin');
              },
            ),
          ),
        ],
      ),
    );
  }
}
