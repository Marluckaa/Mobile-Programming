import 'package:flutter/material.dart';
import 'package:habit/ui/colors.dart';
import 'package:habit/ui/splash/splash_page.dart';
import 'package:habit/utils/constants.dart';
import 'package:habit/utils/labels.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final scheme = ColorScheme.fromSeed(seedColor: AppColors.orange);
    final base = ThemeData.light().textTheme;
    return MaterialApp(
      title: Labels.appName,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        colorScheme: scheme,
        textTheme: base.copyWith(
          headlineLarge: const TextStyle(
            fontFamily: Constants.manrope,

          )
        ).apply(
          bodyColor: AppColors.textColor,
          displayColor: AppColors.textColor,
        )
      ),
      home: const SplashPage(),
    );
  }
}

