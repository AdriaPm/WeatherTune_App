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
    apiKey: 'AIzaSyCC80ulKPRJJWzEWfybzStlP1G2JOETN_M',
    appId: '1:7395802710:web:fa0df91c6f6372963645f7',
    messagingSenderId: '7395802710',
    projectId: 'weathertune-80cee',
    authDomain: 'weathertune-80cee.firebaseapp.com',
    databaseURL: 'https://weathertune-80cee-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'weathertune-80cee.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYEAYMY72P8TXloX1GMngaappcrARU4x4',
    appId: '1:7395802710:android:c893b276dd79a1ca3645f7',
    messagingSenderId: '7395802710',
    projectId: 'weathertune-80cee',
    databaseURL: 'https://weathertune-80cee-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'weathertune-80cee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDW7vLTiLxAuNYt1ogrod3R_VePZgJy3w',
    appId: '1:7395802710:ios:3652774249c13c7a3645f7',
    messagingSenderId: '7395802710',
    projectId: 'weathertune-80cee',
    databaseURL: 'https://weathertune-80cee-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'weathertune-80cee.appspot.com',
    iosBundleId: 'com.example.weatherTune',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDDW7vLTiLxAuNYt1ogrod3R_VePZgJy3w',
    appId: '1:7395802710:ios:2a4bccbe8cb0fbbb3645f7',
    messagingSenderId: '7395802710',
    projectId: 'weathertune-80cee',
    databaseURL: 'https://weathertune-80cee-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'weathertune-80cee.appspot.com',
    iosBundleId: 'com.example.weatherTune.RunnerTests',
  );
}
