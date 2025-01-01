import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_controller/controller.dart';
import '../service.dart';

class AppInitialize {
  AppInitialize._();

  static Future initApp() async {
    WidgetsFlutterBinding.ensureInitialized();

     const FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyCbGl2osHjnXn0LIKqIJkp3qTYso6TL6k0",
      appId: "1:742613982352:android:f36d42f34419963c924c15",
      messagingSenderId: "742613982352",
      projectId: "wander-6a419",
      storageBucket: 'wander-6a419.appspot.com',
    );

     const FirebaseOptions ios = FirebaseOptions(
      apiKey: 'AIzaSyDm1wDAb7QqlrBbZBm-hE6i6HnFlZpILeU',
      appId: '1:742613982352:ios:136f024dc8c26165924c15',
      messagingSenderId: '742613982352',
      storageBucket: 'wander-6a419.appspot.com',
      iosBundleId: 'app.oasis.com', projectId: 'wander-6a419',
    );
    await Firebase.initializeApp(options: Platform.isIOS? ios : android );
    await StorageService.initialize();
  }
}

class RootBinding implements Bindings {
  final ReleaseMode releaseMode;
  RootBinding({required this.releaseMode});

  @override
  Future<void> dependencies() async {
    ApiEndPoints(releaseMode: releaseMode);
    Get.put<ApiRepository>(ApiRepository());
    Get.put<AppController>(AppController());
  }
}
