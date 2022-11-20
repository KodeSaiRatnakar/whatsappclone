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
    apiKey: 'AIzaSyA4yJleOd6bBdaV-m76nEOZAdvgPjR9zJc',
    appId: '1:745858411094:web:4438de714ba827de8de9f7',
    messagingSenderId: '745858411094',
    projectId: 'whatsappclone-6683d',
    authDomain: 'whatsappclone-6683d.firebaseapp.com',
    storageBucket: 'whatsappclone-6683d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFTd-cY012Tw8RGe1VgHBTtbvBTXTxG0Y',
    appId: '1:745858411094:android:9ef8f915e0c717a88de9f7',
    messagingSenderId: '745858411094',
    projectId: 'whatsappclone-6683d',
    storageBucket: 'whatsappclone-6683d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDxC6HitXD0g2m8U0D8WKGTUSNxyxsjn7c',
    appId: '1:745858411094:ios:f399c34dc408afa48de9f7',
    messagingSenderId: '745858411094',
    projectId: 'whatsappclone-6683d',
    storageBucket: 'whatsappclone-6683d.appspot.com',
    iosClientId: '745858411094-fl5d365m7mskh8htfa6ucc6rkomvt57m.apps.googleusercontent.com',
    iosBundleId: 'com.example.whatsapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDxC6HitXD0g2m8U0D8WKGTUSNxyxsjn7c',
    appId: '1:745858411094:ios:f399c34dc408afa48de9f7',
    messagingSenderId: '745858411094',
    projectId: 'whatsappclone-6683d',
    storageBucket: 'whatsappclone-6683d.appspot.com',
    iosClientId: '745858411094-fl5d365m7mskh8htfa6ucc6rkomvt57m.apps.googleusercontent.com',
    iosBundleId: 'com.example.whatsapp',
  );
}
