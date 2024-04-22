import 'package:flutter/material.dart';

// Define un widget para mostrar una descripción personalizada en la parte inferior
class CustomBottomDescription extends StatelessWidget {
  const CustomBottomDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Texto "Documentary" con estilo personalizado
        Text(
          'Documentary',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 2, // Espacio entre los textos
        ),
        // Texto "History" con estilo personalizado
        Text(
          'History',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
