import 'package:flutter/material.dart';

// Define un widget para mostrar un ícono de corazón dentro de un círculo
class FavoriteCircle extends StatelessWidget {
  const FavoriteCircle({
    Key? key,
    required this.size,
    required this.percent,
  }) : super(key: key);

  final Size size; // Tamaño del widget
  final double percent; // Porcentaje de opacidad del ícono

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // Posiciona el widget en la esquina superior derecha de la pantalla
      top: size.height * 0.015,
      right: 15,
      child: Container(
        // Contenedor del círculo
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle, // Forma del contenedor (círculo)
          color: Colors.white, // Color de fondo del contenedor
          boxShadow: [
            // Sombra del contenedor
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          // Icono de corazón dentro del círculo
          Icons.favorite,
          size: 24,
          color: percent < 0.56 ? Colors.white.withOpacity(1 - percent) : Colors.black, // Cambia el color del ícono dependiendo del porcentaje de opacidad
        ),
      ),
    );
  }
}
