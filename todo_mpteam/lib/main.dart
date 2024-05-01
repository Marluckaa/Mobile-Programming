import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_mpteam/screens/login/startup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCyLNmAfixyssVwvg1DdBxlG32Y5tDipX0",
            authDomain: "lab-cs3a-41.firebaseapp.com",
            projectId: "lab-cs3a-41",
            storageBucket: "lab-cs3a-41.appspot.com",
            messagingSenderId: "451438020080",
            appId: "1:451438020080:web:7bb01293701f4c04700935"));
  } else if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDvj6SJi-Ei93OcjLJLSTJ8om14WwjoRbQ",
            appId: "1:451438020080:android:0eb3497082a0dcfc700935",
            messagingSenderId: "451438020080",
            projectId: "lab-cs3a-41",
            storageBucket: 'gs://lab-cs3a-41.appspot.com',));
  }
else {
    //iOS Firebase initialization
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDvj6SJi-Ei93OcjLJLSTJ8om14WwjoRbQ",
            appId: "1:451438020080:ios:7bb01293701f4c04700935",
            messagingSenderId: "451438020080",
            projectId: "lab-cs3a-41",
            iosClientId: "451438020080-n5bb3i5vj6sj7eifj93ocjljlstj8om1.apps.googleusercontent.com",
            iosBundleId: "com.example.yourApp",
            storageBucket: 'gs://lab-cs3a-41.appspot.com'));
}
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StartUpScreen(),
  ));
}
