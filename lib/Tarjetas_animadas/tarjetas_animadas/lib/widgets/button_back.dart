import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({
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
      left: 15,
      child: Icon(
        Icons.arrow_back,
        size: 30,
        color: percent < 0.56 ? Colors.white.withOpacity(1 - percent) : Colors.black,
      ),
    );
  }
}
