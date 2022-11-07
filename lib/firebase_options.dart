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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCjhcKYD_1ilkYCQ3xNL5NsI9KoquOOoD0',
    appId: '1:72284431030:web:d4669931209eecca1bfc17',
    messagingSenderId: '72284431030',
    projectId: 'orion-2437c',
    authDomain: 'orion-2437c.firebaseapp.com',
    storageBucket: 'orion-2437c.appspot.com',
    measurementId: 'G-Q1H2KBWR3N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAimZViwRp1XOfkH3kkZwZV8WK82wzBdlU',
    appId: '1:72284431030:android:e747fd4f6c4c076a1bfc17',
    messagingSenderId: '72284431030',
    projectId: 'orion-2437c',
    storageBucket: 'orion-2437c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDu-aA84LF8tlT6Nw-kdMSGIHw7UlA6PVI',
    appId: '1:72284431030:ios:d7b27fc130e2d8cb1bfc17',
    messagingSenderId: '72284431030',
    projectId: 'orion-2437c',
    storageBucket: 'orion-2437c.appspot.com',
    iosClientId: '72284431030-bus0uie8im5gmhdn0r9a7vvphgpjtioe.apps.googleusercontent.com',
    iosBundleId: 'com.example.orion',
  );
}