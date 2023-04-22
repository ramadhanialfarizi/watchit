import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/core/utils/routes.dart';
import 'package:movie_app/features/authentication/view_model/signin_provider.dart';
import 'package:movie_app/features/authentication/view_model/signup_provider.dart';
import 'package:movie_app/features/detail/view_model/movie/detail_movie_provider.dart';
import 'package:movie_app/features/detail/view_model/people/detail_people_provider.dart';
import 'package:movie_app/features/detail/view_model/tv_show/detail_tv_show_provider.dart';
import 'package:movie_app/features/home/view_model/movie/movie_provider.dart';
import 'package:movie_app/features/home/view_model/tv_show/tv_show_provider.dart';
import 'package:movie_app/features/people/view_model/people_provider.dart';
import 'package:movie_app/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SigninProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignupProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TvShowProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailMovieProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailTvShowProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PeopleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailPeopleProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: AppRoutes().routes,
    );
  }
}
