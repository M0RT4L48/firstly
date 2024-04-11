import 'package:tarjetas_animadas/home_challenge_sliver.dart';
import 'package:tarjetas_animadas/theme.dart'
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sliver Challenge Animated',
      theme: theme,
      home: HomeSliverChallenge(),
    );
  }
}