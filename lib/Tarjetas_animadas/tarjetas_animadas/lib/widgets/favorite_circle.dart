import 'package:flutter/material.dart';

class FavoriteCircle extends StatelessWidget {
  const FavoriteCircle({
    Key? key,
    required this.size,
    required this.percent,
  }) : super(key: key);

  final Size size;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.015,
      right: 15,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          Icons.favorite,
          size: 24,
          color: percent < 0.56 ? Colors.white.withOpacity(1 - percent) : Colors.black,
        ),
      ),
    );
  }
}
