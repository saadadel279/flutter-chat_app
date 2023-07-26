import 'package:chat_app/Models/messag.dart';
import 'package:chat_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/BubbleChat.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({super.key});
  CollectionReference messages = FirebaseFirestore.instance.collection(KmessagesCollection);  
  TextEditingController controller=TextEditingController();
  final ScrollController _controller = ScrollController();
  
  @override
  Widget build(BuildContext context) {
   String email= ModalRoute.of(context)!.settings.arguments as String;
    return  StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(KcreatedAt,descending: true).snapshots(),
      builder: (context,snapshot){
          
        if(snapshot.hasData){
          List<MessageModel>messagsList=[];
          for(int i=0;i<snapshot.data!.docs.length;i++){
            messagsList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
          }
           return Scaffold(
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
            child: ListView.builder(
              reverse: true,
              controller: _controller,
              itemCount: messagsList.length,
              itemBuilder: (context,index){
              return messagsList[index].id==email?
               bubbleChat(message: messagsList[index],):
               bubbleChatforResever(message:  messagsList[index]);
            }),
            
          ),
           Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                messages.add({
                  KMessageSR:data,
                  KcreatedAt:DateTime.now(),
                  'id':email
                  
                });
                controller.clear();
                 _controller.animateTo( 0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
  );
              },
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.send,color: KPrimaryBackgraund),
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
        }else{
          return const Scaffold(
            body: Center(
              child: Text("Loading..",style: TextStyle(fontSize: 25,
              fontWeight: FontWeight.bold),),
            ),
          );
        }
      });
  }
}

