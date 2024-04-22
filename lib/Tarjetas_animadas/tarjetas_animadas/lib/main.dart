import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tarjetas_animadas/widgets/home_challenge_sliver.dart';
import 'package:tarjetas_animadas/theme.dart';

// Función principal que ejecuta la aplicación
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp(
      // Deshabilita el banner de depuración en la esquina superior derecha
      debugShowCheckedModeBanner: false,
      // Título de la aplicación
      title: 'Sliver Challenge Animated',
      theme: theme,
      home: HomeSliverChallenge(),
    );
  }
}
