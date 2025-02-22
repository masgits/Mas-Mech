// ignore_for_file: avoid_print

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:masmech/app.dart';
import 'package:permission_handler/permission_handler.dart';


Future<void> requestLocationPermission() async {
  var status = await Permission.location.request();
  if (status.isGranted) {
    print("✅ Location permission granted");
  } else {
    print("❌ Location permission denied");
  }
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await requestLocationPermission();

  try {
    if (Firebase.apps.isEmpty) {
      //for Android
      if (Platform.isAndroid) {
        await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAMucGX-hHs71X_EsCCPJwUOnvAvtY5pR8",
              authDomain: "mas-mech.firebaseapp.com",
              databaseURL:
                  "https://mas-mech-default-rtdb.asia-southeast1.firebasedatabase.app",
              projectId: "mas-mech",
              storageBucket: "mas-mech.firebasestorage.app",
              messagingSenderId: "732603828193",
              appId: "1:732603828193:web:75422f8d31ad66b6d7b4a0",
              measurementId: "G-P7Q5ZJJ7L8"),
        );
      } else {
        //for IOS
        await Firebase.initializeApp();
      }
    }
  } catch (e) {
    print("Firebase initialization error: $e");
  }

  runApp(const App());
}
