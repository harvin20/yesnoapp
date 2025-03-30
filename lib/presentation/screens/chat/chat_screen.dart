import 'package:flutter/material.dart';
import 'package:yesnoapp/presentation/widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://i.pinimg.com/736x/79/44/38/7944381eb5bf4b36b55a006d8b2151c9.jpg'),
          ),
        ),
        title: Text('mi amor'),
        centerTitle: false,
        ),
        body: _ChatView(),
        );
  }
}

class _ChatView extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child:ListView.builder(
                itemCount: 100 ,
                itemBuilder: (context, index) {
                return MyMessageBubble();
              },)
               ),
           
        
            Text('mundo'),
        
          ],
        ),
      ),
    );
  }
}
