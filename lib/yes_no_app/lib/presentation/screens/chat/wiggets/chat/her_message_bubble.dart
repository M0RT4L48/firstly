import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.text,
                  style: const TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  // Muestra la hora actual debajo del texto del mensaje
                  '${DateTime.now().hour}:${DateTime.now().minute}',
                  style: TextStyle(color: Colors.white.withOpacity(0.5)),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 5),
        _ImageBubble(message.imageUrl!),
        SizedBox(height: 10),
      ],
    );
  }
}


class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
      width: size.width * 0.7,
      height: 150,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return Container(
          width: size.width * 0.7,
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: const Text('Mi amor está enviando un mensaje'),
        );
      },)
    );
  }
}