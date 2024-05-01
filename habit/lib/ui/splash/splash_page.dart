import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:habit/utils/labels.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'bg.png',
            ),
            fit: BoxFit.cover,
           )
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio:4/3 ,
            child: Center(
              child: Text(
                Labels.welcomeTo,
                style: style.headlineLarge,
                textAlign: TextAlign.center,
              
              ),
            ),
          )
        ],),

    );
  }
}