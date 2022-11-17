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
    apiKey: 'AIzaSyA822ksyl-8twnWd7kKkQcDOXHJVZKcUAw',
    appId: '1:12340399281:web:235fedc63f07eb3e3ea690',
    messagingSenderId: '12340399281',
    projectId: 'ninja-brew-crew-a6f23',
    authDomain: 'ninja-brew-crew-a6f23.firebaseapp.com',
    storageBucket: 'ninja-brew-crew-a6f23.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeIMhKAbu8Bs36T7uZpbqtTr5oIBO3tVg',
    appId: '1:12340399281:android:6139bb8db1e9b6de3ea690',
    messagingSenderId: '12340399281',
    projectId: 'ninja-brew-crew-a6f23',
    storageBucket: 'ninja-brew-crew-a6f23.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBPOlLCwJh5E90kA0ykBRtgUtX3dbs5n3Q',
    appId: '1:12340399281:ios:14769210d6c611ae3ea690',
    messagingSenderId: '12340399281',
    projectId: 'ninja-brew-crew-a6f23',
    storageBucket: 'ninja-brew-crew-a6f23.appspot.com',
    iosClientId: '12340399281-t9gpekjipon5r219amgghiebt77eh97k.apps.googleusercontent.com',
    iosBundleId: 'com.example.brewCrew',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBPOlLCwJh5E90kA0ykBRtgUtX3dbs5n3Q',
    appId: '1:12340399281:ios:14769210d6c611ae3ea690',
    messagingSenderId: '12340399281',
    projectId: 'ninja-brew-crew-a6f23',
    storageBucket: 'ninja-brew-crew-a6f23.appspot.com',
    iosClientId: '12340399281-t9gpekjipon5r219amgghiebt77eh97k.apps.googleusercontent.com',
    iosBundleId: 'com.example.brewCrew',
  );
}