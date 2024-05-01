//import 'demo/app.dart';
import 'package:demo/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  
    // ignore: unused_local_variable
    FirebaseOptions firebaseOptions;
  if (kIsWeb) {
    firebaseOptions = const FirebaseOptions(
      apiKey: "AIzaSyDMB_XefmAFEcjNNgg9hxqWtHQ8wI9RAUc",
      appId: "1:426905188164:web:0443a80b910efb1efe8911",
      messagingSenderId: "426905188164",
      projectId:  "medi-signin",
    );
  } 
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(FirebaseUserRepo()));
}

	
  
