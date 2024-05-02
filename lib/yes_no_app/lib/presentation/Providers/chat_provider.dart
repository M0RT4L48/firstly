
import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{
  final ScrollController chatScrollController = ScrollController();
  //Instancia de la clase GetYesNoAnswer
  final getYesNoAnswer = GetYesNoAnswer();
  List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'holi, como tas?', fromWho: FromWho.me)
  ];


// Metodo para enviar mensaje
Future<void> sendMessage(String text) async {
 if (text.isEmpty){
    print('Error mensaje vacio');
    return;
  }
final newMessage = Message(text: text, fromWho: FromWho.me);

//agregar un mensaje a la lista
messageList.add(newMessage);
if(text.endsWith('?')){
  herReply();
}
notifyListeners();
moveScrollToBottom();
final totalDeMensajes = messageList.length;
print('Cantidad de mensajes enviados: $totalDeMensajes');
}

//crea la respuesta de "ella"
Future<void> herReply() async{
  final herMessage = await getYesNoAnswer.getAnswer();
  //añadir en la lista de mensaje 
  messageList.add(herMessage);
  //notificar si algo de provider cambio para que se guarde en el estado
  notifyListeners();
  //mueve el scroll hasta el ultimo mensaje recibido
  moveScrollToBottom();
}


Future<void> moveScrollToBottom() async{
  await Future.delayed(const Duration(milliseconds: 100));

  chatScrollController.animateTo(
    chatScrollController.position.maxScrollExtent, 
    duration: const Duration(milliseconds: 300), 
    curve: Curves.easeOut);
}
}