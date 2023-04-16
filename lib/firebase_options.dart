// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD16IL8PphgWtgP0DMMedqovXi7RpPXHXA',
    appId: '1:591304894104:web:045493cb4f1694a96e12ed',
    messagingSenderId: '591304894104',
    projectId: 'movie-app-bd3fc',
    authDomain: 'movie-app-bd3fc.firebaseapp.com',
    storageBucket: 'movie-app-bd3fc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCt0Tt0HLoza5yARcW84UNYfzMZAg7FYDU',
    appId: '1:591304894104:android:16d408935cfe3f4d6e12ed',
    messagingSenderId: '591304894104',
    projectId: 'movie-app-bd3fc',
    storageBucket: 'movie-app-bd3fc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6RcfJwiXC-mtpqcEY4UHjKj70S5w0VEc',
    appId: '1:591304894104:ios:d5bbd8765d6f03ca6e12ed',
    messagingSenderId: '591304894104',
    projectId: 'movie-app-bd3fc',
    storageBucket: 'movie-app-bd3fc.appspot.com',
    iosClientId: '591304894104-cln3k9mdtada2mudcsl1p1bku6ag6ed4.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6RcfJwiXC-mtpqcEY4UHjKj70S5w0VEc',
    appId: '1:591304894104:ios:d5bbd8765d6f03ca6e12ed',
    messagingSenderId: '591304894104',
    projectId: 'movie-app-bd3fc',
    storageBucket: 'movie-app-bd3fc.appspot.com',
    iosClientId: '591304894104-cln3k9mdtada2mudcsl1p1bku6ag6ed4.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieApp',
  );
}
