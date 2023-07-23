

import 'package:flutter/material.dart';

import '../constants.dart';

class bubbleChat extends StatelessWidget {
  const bubbleChat({
    super.key,
  });

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
        child: const Text('I am a new user',
        style: TextStyle(
          color: Colors.white,
          
        ),),
      ),
    );
  }
}