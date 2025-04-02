import 'package:flutter/material.dart';
import 'package:yesnoapp/config/helpers/get_yes_no_answer.dart';
import 'package:yesnoapp/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

final  chatScrollController = ScrollController();
final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'hola', fromWho: FromWho.me),
    Message(text: 'ya regresaste', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async{
    if(text.isEmpty) return; 
  final newMessage = Message (text: text, fromWho: FromWho.me);
  messageList.add(newMessage);

  if(text.endsWith('?')) {
    await herReply();
  }

  notifyListeners();
  moveScrollToBotton();
  }
Future<void> herReply() async {
  final herMessage = await getYesNoAnswer.getAnswer();
   messageList.add(herMessage);
   notifyListeners();
   
   moveScrollToBotton();
}







  Future<void> moveScrollToBotton()async{

    await Future.delayed(Duration(milliseconds: 100));
    chatScrollController.animateTo(
    chatScrollController.position.maxScrollExtent, 
    duration:  Duration(milliseconds: 300),
     curve: Curves.easeOut);
  }
}