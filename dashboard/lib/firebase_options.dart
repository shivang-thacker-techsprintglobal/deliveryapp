// File generated for Firebase project sushideliveryapp-dfc29.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
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
          'DefaultFirebaseOptions have not been configured for macos.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAhFiKy-Xrr6sywU9MCQWdyPrCaYLuwF3E',
    appId: '1:499952759339:web:e45e0a79e764a4317f306e',
    messagingSenderId: '499952759339',
    projectId: 'sushideliveryapp-dfc29',
    authDomain: 'sushideliveryapp-dfc29.firebaseapp.com',
    storageBucket: 'sushideliveryapp-dfc29.firebasestorage.app',
    measurementId: 'G-7082F5SXNP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGooyvokZMZ8ZPOnErJnnbpvORmwaDASs',
    appId: '1:499952759339:android:fe20bc8a645e03e27f306e',
    messagingSenderId: '499952759339',
    projectId: 'sushideliveryapp-dfc29',
    storageBucket: 'sushideliveryapp-dfc29.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBURFDnIdCHTufE1RIhj1DcL8kBE-3SQDg',
    appId: '1:499952759339:ios:8425b59085906e967f306e',
    messagingSenderId: '499952759339',
    projectId: 'sushideliveryapp-dfc29',
    storageBucket: 'sushideliveryapp-dfc29.firebasestorage.app',
    iosClientId:
        '499952759339-1v6827l1p4jqpq6c9nq4fcsbaironcal.apps.googleusercontent.com',
    iosBundleId: 'com.example.admin',
  );
}
