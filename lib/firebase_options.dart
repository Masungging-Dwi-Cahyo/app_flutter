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
    apiKey: 'AIzaSyDEWttPIKjZh1nBiI6LiJnzWYlHKYowLOg',
    appId: '1:610252283162:web:97b19cd7f196613738a0a3',
    messagingSenderId: '610252283162',
    projectId: 'fir-flutter-33e47',
    authDomain: 'fir-flutter-33e47.firebaseapp.com',
    storageBucket: 'fir-flutter-33e47.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWHmT27iwksGUx2UsFyehJDkg8idrA5fQ',
    appId: '1:610252283162:android:8b161e5556bcc1d038a0a3',
    messagingSenderId: '610252283162',
    projectId: 'fir-flutter-33e47',
    storageBucket: 'fir-flutter-33e47.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB17SDq7VrC5Xi5avyIKBRaOjTB90_QPx4',
    appId: '1:610252283162:ios:c76b53dccebf970b38a0a3',
    messagingSenderId: '610252283162',
    projectId: 'fir-flutter-33e47',
    storageBucket: 'fir-flutter-33e47.appspot.com',
    iosClientId: '610252283162-efgvplj6pr236s9g7ntiuhuk1tct3ics.apps.googleusercontent.com',
    iosBundleId: 'com.example.appFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB17SDq7VrC5Xi5avyIKBRaOjTB90_QPx4',
    appId: '1:610252283162:ios:c76b53dccebf970b38a0a3',
    messagingSenderId: '610252283162',
    projectId: 'fir-flutter-33e47',
    storageBucket: 'fir-flutter-33e47.appspot.com',
    iosClientId: '610252283162-efgvplj6pr236s9g7ntiuhuk1tct3ics.apps.googleusercontent.com',
    iosBundleId: 'com.example.appFlutter',
  );
}