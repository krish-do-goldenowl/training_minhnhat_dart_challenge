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
    apiKey: 'AIzaSyBA0d813rdsL3_3mnw4TopfbLHXU8WPwSQ',
    appId: '1:1005960475632:web:630f74f509d5578585e335',
    messagingSenderId: '1005960475632',
    projectId: 'goldenowl-deploy-testing',
    authDomain: 'goldenowl-deploy-testing.firebaseapp.com',
    storageBucket: 'goldenowl-deploy-testing.appspot.com',
    measurementId: 'G-V99956RZL6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAjS1j-fcf44DoBiuMiA5o6PS8voVZfqFs',
    appId: '1:1005960475632:android:74ab1c49c4ffe47085e335',
    messagingSenderId: '1005960475632',
    projectId: 'goldenowl-deploy-testing',
    storageBucket: 'goldenowl-deploy-testing.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDcbCnVTgU_Jpz3Ml5GB0SxhQsPyejQI8o',
    appId: '1:1005960475632:ios:bdf0c00e0ba3915c85e335',
    messagingSenderId: '1005960475632',
    projectId: 'goldenowl-deploy-testing',
    storageBucket: 'goldenowl-deploy-testing.appspot.com',
    iosClientId: '1005960475632-9k2q5pk13sp2uqfkorjfr3g3qme4oh0e.apps.googleusercontent.com',
    iosBundleId: 'com.maverick.go.gallerywidgets.galleryWidgets',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDcbCnVTgU_Jpz3Ml5GB0SxhQsPyejQI8o',
    appId: '1:1005960475632:ios:b7bae2ba14da3f5a85e335',
    messagingSenderId: '1005960475632',
    projectId: 'goldenowl-deploy-testing',
    storageBucket: 'goldenowl-deploy-testing.appspot.com',
    iosClientId: '1005960475632-n1sk9t2813c7h487qh60s288olf51eut.apps.googleusercontent.com',
    iosBundleId: 'com.maverick.go.gallerywidgets.galleryWidgets.RunnerTests',
  );
}
