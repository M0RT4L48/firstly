import 'dart:js';

import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/screens/chat/wiggets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/screens/chat/wiggets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/screens/chat/wiggets/chat/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

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
  final ChatProvider = context.watch<ChatProvider>();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: ChatProvider,
            itemBuilder: (context, index) {
            return (index % 2 == 0)
            ? const HerMessageBubble()
            : const MyMessageBubble();
            
          })),
            //caja de texto
           const MessageFieldBox(),
        ]),
      ),
    );
  }
}