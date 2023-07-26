

import 'package:chat_app/Models/messag.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class bubbleChat extends StatelessWidget {
  const bubbleChat({
    super.key,
    required this.message
  });
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(20),
        
        decoration: const BoxDecoration(
          color: KPrimaryBackgraund,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
            bottomRight: Radius.circular(35),
          )
          ),
        
        margin: const EdgeInsets.all(8),
        child:  Text(
          message.message,
        style: const TextStyle(
          color: Colors.white,
          
        ),),
      ),
    );
  }
}



class bubbleChatforResever extends StatelessWidget {
  const bubbleChatforResever({
    super.key,
    required this.message
  });
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(20),
        
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 132, 158, 161),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
            bottomLeft: Radius.circular(35),
          )
          ),
        
        margin: const EdgeInsets.all(8),
        child:  Text(
          message.message,
        style: const TextStyle(
          color: Colors.white,
          
        ),),
      ),
    );
  }
}

