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
    apiKey: 'AIzaSyCiiy8upGAidunQPNXDuNxV28HUvFkQil0',
    appId: '1:727150057482:web:d117353019b425343a27f3',
    messagingSenderId: '727150057482',
    projectId: 'sign-language-c4001',
    authDomain: 'sign-language-c4001.firebaseapp.com',
    databaseURL: 'https://sign-language-c4001-default-rtdb.firebaseio.com',
    storageBucket: 'sign-language-c4001.appspot.com',
    measurementId: 'G-FV7CGRLLJ2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1OcYOU3iXGG83svZ_R3SCfnPDt0V0D_s',
    appId: '1:727150057482:android:5173fd86075fe8fd3a27f3',
    messagingSenderId: '727150057482',
    projectId: 'sign-language-c4001',
    databaseURL: 'https://sign-language-c4001-default-rtdb.firebaseio.com',
    storageBucket: 'sign-language-c4001.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFZLZnxZqWiHgIgsO6UVGHdVm7H_8nq4w',
    appId: '1:727150057482:ios:d86012dd80e5e3813a27f3',
    messagingSenderId: '727150057482',
    projectId: 'sign-language-c4001',
    databaseURL: 'https://sign-language-c4001-default-rtdb.firebaseio.com',
    storageBucket: 'sign-language-c4001.appspot.com',
    androidClientId: '727150057482-g109986u4vpdjfs6as62pq59j9dsah35.apps.googleusercontent.com',
    iosClientId: '727150057482-d6vhlrrmvluugvtc52hrekii97dho2j5.apps.googleusercontent.com',
    iosBundleId: 'com.example.signLang',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCFZLZnxZqWiHgIgsO6UVGHdVm7H_8nq4w',
    appId: '1:727150057482:ios:d86012dd80e5e3813a27f3',
    messagingSenderId: '727150057482',
    projectId: 'sign-language-c4001',
    databaseURL: 'https://sign-language-c4001-default-rtdb.firebaseio.com',
    storageBucket: 'sign-language-c4001.appspot.com',
    androidClientId: '727150057482-g109986u4vpdjfs6as62pq59j9dsah35.apps.googleusercontent.com',
    iosClientId: '727150057482-d6vhlrrmvluugvtc52hrekii97dho2j5.apps.googleusercontent.com',
    iosBundleId: 'com.example.signLang',
  );
}
