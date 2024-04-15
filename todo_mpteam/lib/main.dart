import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_mpteam/common/color_extension.dart';
import 'package:todo_mpteam/screens/login/startup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    // Initialize Firebase for web
    await Firebase.initializeApp(
      name: 'Meditation',
      options: const FirebaseOptions(
        apiKey: "AIzaSyB3irFjqCGsIETd3BtcGT7aQaTddjrpOAk",
        authDomain: "mp-project-aeafa.firebaseapp.com",
        projectId: "mp-project-aeafa",
        storageBucket: "mp-project-aeafa.appspot.com",
        messagingSenderId: "427903546085",
        appId: "1:427903546085:web:33491ef1705048036f5a0c",
        measurementId: "G-Y3N2DTF8NT"
      ),
    );
  } else if (Platform.isAndroid){
    // Initialize Firebase for non-web platforms
    await Firebase.initializeApp(
      name: 'Meditation',
      options: const FirebaseOptions(
        apiKey: "AIzaSyB3irFjqCGsIETd3BtcGT7aQaTddjrpOAk",
        authDomain: "mp-project-aeafa.firebaseapp.com",
        projectId: "mp-project-aeafa",
        storageBucket: "mp-project-aeafa.appspot.com",
        messagingSenderId: "427903546085",
        appId: "1:427903546085:web:33491ef1705048036f5a0c",
        measurementId: "G-Y3N2DTF8NT"
    ),
    );
  }else if (Platform.isIOS) {
    // Initialize Firebase for iOS
    await Firebase.initializeApp(
      name: 'Meditation',
      options: const FirebaseOptions(
        apiKey: "AIzaSyB3irFjqCGsIETd3BtcGT7aQaTddjrpOAk",
        appId: "1:427903546085:ios:33491ef1705048036f5a0c",
        messagingSenderId: "427903546085",
        projectId: "mp-project-aeafa",
        storageBucket: "mp-project-aeafa.appspot.com",
        iosClientId: "427903546085-9q6k9vljv6k9q6k9q6k9q6k9q6k9q6k9.apps.googleusercontent.com",
        iosBundleId: "com.example.meditation",
      ),
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meditation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "HelveticaNeue",
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: false,
      ),
      home: const StartUpScreen(),
    );
  }
}
