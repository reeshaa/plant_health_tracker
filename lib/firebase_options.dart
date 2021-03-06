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
    apiKey: 'AIzaSyD_FngiMMEtpaty0WmanzEp2smtJrNHyKA',
    appId: '1:568612176853:web:b0fd60f97d3c2d1df5735c',
    messagingSenderId: '568612176853',
    projectId: 'plantcare-7c507',
    authDomain: 'plantcare-7c507.firebaseapp.com',
    databaseURL: 'https://plantcare-7c507-default-rtdb.firebaseio.com',
    storageBucket: 'plantcare-7c507.appspot.com',
    measurementId: 'G-V88F7JW8CK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUs13dzFXVOdnYwWxbb2JD4L7WuM296rk',
    appId: '1:568612176853:android:2711b58713fb0571f5735c',
    messagingSenderId: '568612176853',
    projectId: 'plantcare-7c507',
    databaseURL: 'https://plantcare-7c507-default-rtdb.firebaseio.com',
    storageBucket: 'plantcare-7c507.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxe3dv74WF5Am68G6otXB0GP9rDmBaKo8',
    appId: '1:568612176853:ios:714a5f22d9de6d8ef5735c',
    messagingSenderId: '568612176853',
    projectId: 'plantcare-7c507',
    databaseURL: 'https://plantcare-7c507-default-rtdb.firebaseio.com',
    storageBucket: 'plantcare-7c507.appspot.com',
    iosClientId: '568612176853-gqlct1ls9envnpot03p8rcnr8mrgrrt8.apps.googleusercontent.com',
    iosBundleId: 'com.example.plantHealthTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCxe3dv74WF5Am68G6otXB0GP9rDmBaKo8',
    appId: '1:568612176853:ios:714a5f22d9de6d8ef5735c',
    messagingSenderId: '568612176853',
    projectId: 'plantcare-7c507',
    databaseURL: 'https://plantcare-7c507-default-rtdb.firebaseio.com',
    storageBucket: 'plantcare-7c507.appspot.com',
    iosClientId: '568612176853-gqlct1ls9envnpot03p8rcnr8mrgrrt8.apps.googleusercontent.com',
    iosBundleId: 'com.example.plantHealthTracker',
  );
}
