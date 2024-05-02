//import 'dart:js';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/Providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/wiggets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/screens/chat/wiggets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/screens/chat/wiggets/chat/shared/message_field_box.dart';



class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://pbs.twimg.com/media/FYPfpZtXgAACWH3.jpg:large'),
          ),
        ),
        title: const Text('Amor♥'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}


class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>(); // Cambia el nombre de la variable local

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length, // Usa la lista de mensajes de chatProvider
                itemBuilder: (context, index) {
                  //Instancia del message que sabrá de quien es el mensaje
                  final message = chatProvider.messageList[index];
                  //Asigna MessageBubble de quien venga el mensaje
                  return (message.fromWho == FromWho.hers)
                      ?  HerMessageBubble(message: message)
                      :  MyMessageBubble(message: message,);
                },
              ),
            ),
            MessageFieldBox(onValue: chatProvider.sendMessage), // Caja de texto
          ],
        ),
      ),
    );
  }
}
