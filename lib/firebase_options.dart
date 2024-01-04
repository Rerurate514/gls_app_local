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
    apiKey: 'AIzaSyCbh5xoPL07k59MMKBcctmTJ5w7N-UvDiY',
    appId: '1:279085910681:web:7ba4d83bacdddeb2154608',
    messagingSenderId: '279085910681',
    projectId: 'fir-test-58395',
    authDomain: 'fir-test-58395.firebaseapp.com',
    storageBucket: 'fir-test-58395.appspot.com',
    measurementId: 'G-WEEC2XXHWW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA9ytD8ZKOAqpglwUV68Cr67Z4TCwo7IW4',
    appId: '1:279085910681:android:c5074aa2a407bafa154608',
    messagingSenderId: '279085910681',
    projectId: 'fir-test-58395',
    storageBucket: 'fir-test-58395.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3n3vYKQHACSnpq7pUQ2LAubhUHw0TPHo',
    appId: '1:279085910681:ios:6d4a080be474e74a154608',
    messagingSenderId: '279085910681',
    projectId: 'fir-test-58395',
    storageBucket: 'fir-test-58395.appspot.com',
    iosBundleId: 'com.example.glsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3n3vYKQHACSnpq7pUQ2LAubhUHw0TPHo',
    appId: '1:279085910681:ios:2c327179746e155b154608',
    messagingSenderId: '279085910681',
    projectId: 'fir-test-58395',
    storageBucket: 'fir-test-58395.appspot.com',
    iosBundleId: 'com.example.glsApp.RunnerTests',
  );
}
