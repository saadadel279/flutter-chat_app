import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/BubbleChat.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: KPrimaryBackgraund,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Image.asset(Klogo,
              height: 55,),
              const Text('Chat')
            ],
          ),
      ),
      body:Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context,index){
              return const bubbleChat();
            }),
            
          ),
           Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.send,color: KPrimaryBackgraund,),
                hintText: 'Message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: KPrimaryBackgraund),
                  
                )
              ),
            ),
          )
        ],
      ),
      
    );
  }
}

