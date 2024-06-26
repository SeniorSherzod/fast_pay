// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDkevph6oBADe3l0WnWPLakrya_ENF6YD4',
    appId: '1:950098412298:android:0a21ccdd2942d0137af0f3',
    messagingSenderId: '950098412298',
    projectId: 'fast-pay-7a66f',
    databaseURL: 'https://fast-pay-7a66f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fast-pay-7a66f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZwxjCoMB40Ky0PiUvVC5s-SmBzM1zRbs',
    appId: '1:950098412298:ios:355114bce254ff637af0f3',
    messagingSenderId: '950098412298',
    projectId: 'fast-pay-7a66f',
    databaseURL: 'https://fast-pay-7a66f-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fast-pay-7a66f.appspot.com',
    androidClientId: '950098412298-a5otrf8ug9mmnh12magjnpdmb5u0f343.apps.googleusercontent.com',
    iosClientId: '950098412298-orhapihb2694p94gils5egsi29jv4qc8.apps.googleusercontent.com',
    iosBundleId: 'com.example.fastPay',
  );

}