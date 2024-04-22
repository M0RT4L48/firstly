import 'package:flutter/material.dart';
import 'package:tarjetas_animadas/theme.dart';

// Define un objeto personalizado
class CutRectangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Configura el estilo de dibujo
    final paint = Paint();
    paint.color = backgroundColor; // Color del rectángulo
    paint.style = PaintingStyle.fill; // Estilo de pintura
    paint.strokeWidth = 10; // Grosor del trazo

    // Define el camino del rectángulo
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width * 0.27, 0);

    // Dibuja el rectángulo en el lienzo
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
