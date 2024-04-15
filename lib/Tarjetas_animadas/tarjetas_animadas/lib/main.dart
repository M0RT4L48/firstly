import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarjetas_animadas/widgets/home_challenge_sliver.dart';
import 'package:tarjetas_animadas/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sliver Challenge Animated',
      theme: theme,
      home: HomeSliverChallenge(),
    );
  }
}
