import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );

    final inputDecoration = InputDecoration(
         enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
        icon: Icon(Icons.send_outlined),
        onPressed: (){
          print('valor de la caja de texto?');
        },
        
        ),
      );

    return TextFormField(
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit value $value');
      },
      onChanged:(value) {
        print('changed: $value ');
      } ,
    );
  }
}