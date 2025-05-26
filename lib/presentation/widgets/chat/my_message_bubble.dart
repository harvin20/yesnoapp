import 'package:flutter/material.dart';
import 'package:yesnoapp/domain/entities/message.dart';
class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({
    super.key, 
    required this.message
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary, 
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text, 
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        
        // Mostrar hora y estado de visto
        Padding(
          padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${message.time.hour}:${message.time.minute.toString().padLeft(2, '0')}',
                style: TextStyle(
                  fontSize: 10, 
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 4),
              Icon(
                message.seen ? Icons.done_all : Icons.done,
                size: 12,
                color: message.seen ? Colors.blue : Colors.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}