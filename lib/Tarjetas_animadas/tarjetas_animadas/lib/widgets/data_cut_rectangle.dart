import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tarjetas_animadas/widgets/custom_buttom_description.dart';

// Define un widget para mostrar datos con respecto al rectángulo cortado en la pantalla
class DataCutRectangle extends StatelessWidget {
  const DataCutRectangle({
    Key? key,
    required this.size,
    required this.percent,
  }) : super(key: key);

  final Size size; // Tamaño de la pantalla
  final double percent; // Porcentaje de corte del rectángulo

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Padding para posicionar el contenido
      padding: EdgeInsets.only(left: size.width * 0.34, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Texto principal con ajuste de posición dinámico
          Padding(
            padding: EdgeInsets.only(
              left: percent > 0.13
                  ? size.width * pow(percent, 5.5).clamp(0.0, 0.2).toDouble()
                  : 0,
              top: size.height *
                  (percent > 0.48
                      ? pow(percent, 10.5).clamp(0.0, 0.6).toDouble()
                      : 0.0),
            ),
            child: Text(
              // Texto principal sobre el contenido
              'Billie Eilish: The world\'s a little blurry',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
            ),
          ),
          // Widget opcional de descripción personalizada con animación
          if (percent < 0.5) ...[
            const SizedBox(
              height: 2,
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: 1 - pow(percent, 0.001).toDouble(),
              child: const CustomBottomDescription(),
            )
          ]
        ],
      ),
    );
  }
}
