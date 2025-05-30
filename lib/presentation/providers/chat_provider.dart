import 'package:flutter/material.dart';
import 'package:yesnoapp/config/helpers/get_yes_no_answer.dart';
import 'package:yesnoapp/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    //Message(text: 'hola', fromWho: FromWho.me),
     //Message(text: 'ya regresaste', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text.trim(), fromWho: FromWho.me);
    //Agregar un nuevo mensaje a la lista
    messageList.add(newMessage);
     print('flutter: Cantidad de mensajes: ${messageList.length}');

    if (text.endsWith('?')) {
      await herReply();
    }

    //notifica a providier que algo cambio
    notifyListeners();
    moveScrollToBotton();
  }
//crear la respuesta de ella
  Future<void> herReply() async {
     //obtener el mensaje de la petición HTTP
    final herMessage = await getYesNoAnswer.getAnswer();
    //añadimos el mensaje de ella a la lista de mensajes 
    messageList.add(herMessage);
    print('flutter: Cantidad de mensajes: ${messageList.length}');
    //notificar a provider los cambios
    notifyListeners();
    //mover el scroll hasta el ultimo mensaje 
    moveScrollToBotton();
  }

  Future<void> moveScrollToBotton() async {
    await Future.delayed(Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
