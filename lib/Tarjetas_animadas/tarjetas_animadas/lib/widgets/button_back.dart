import 'package:flutter/material.dart';

// Define un botón de flecha hacia atrás
class ButtonBack extends StatelessWidget {
  const ButtonBack({
    Key? key,
    required this.size,
    required this.percent,
  }) : super(key: key);

  final Size size; // Tamaño del botón
  final double percent; // Porcentaje de opacidad

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // Posiciona el botón en la parte superior izquierda de la pantalla
      top: size.height * 0.015,
      left: 15,
      child: Icon(
        // Icono de flecha hacia atrás
        Icons.arrow_back,
        size: 30,
        color: percent < 0.56 ? Colors.white.withOpacity(1 - percent) : Colors.black, // Cambia el color del icono dependiendo del porcentaje de opacidad
      ),
    );
  }
}
