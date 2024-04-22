import 'package:flutter/material.dart';

// Define un widget para mostrar una foto de portada
class CoverPhoto extends StatelessWidget {
  const CoverPhoto({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size; // Tamaño de la foto de portada

  @override
  Widget build(BuildContext context) {
    return Container(
      // Contenedor para la foto de portada
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Bordes redondeados para el contenedor
      ),
      width: size.width * 0.27, // Ancho de la foto de portada
      height: size.height * 0.18, // Altura de la foto de portada
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // Bordes redondeados para la imagen
        child: Image.asset(
          'assets/BE-PortadaC.jpg', // Ruta de la imagen de portada
          fit: BoxFit.fill, // Ajusta la imagen para llenar el contenedor
        ),
      ),
    );
  }
}
