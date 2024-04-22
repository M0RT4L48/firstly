import 'package:flutter/material.dart';

// Este widget coloca una imagen como fondo
class BackgroundSliver extends StatelessWidget {
  const BackgroundSliver({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // Posiciona la imagen en toda la pantalla
      left: 0,
      right: 0,
      bottom: 0,
      top: 0,
      child: Image.asset(
        // Ruta de la imagen a mostrar
        'assets/sliver/BE-PortadaG.jpg',
        fit: BoxFit.fill, // Ajusta la imagen para que llene el área
      ), 
    );
  }
}
