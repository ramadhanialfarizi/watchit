import 'package:flutter/material.dart';
import 'package:movie_app/features/authentication/view/signin_page.dart';
import 'package:movie_app/features/authentication/view/signup_page.dart';
import 'package:movie_app/features/favorite/view/favorite_page.dart';
import 'package:movie_app/features/home/view/home_page.dart';
import 'package:movie_app/features/onboarding/view/splash_screen.dart';
import 'package:movie_app/features/people/view/people_page.dart';

class AppRoutes {
  MaterialPageRoute? routes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (context) => const SignupPages(),
        );
      case '/signin':
        return MaterialPageRoute(
          builder: (context) => const SigninPages(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (context) => const HomePages(),
        );
      case '/people':
        return MaterialPageRoute(
          builder: (context) => const PeoplePage(),
        );
      case '/favorite':
        return MaterialPageRoute(
          builder: (context) => const FavoritePage(),
        );
    }
    return null;
  }
}
