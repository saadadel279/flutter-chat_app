import 'package:chat_app/Screens/Login_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const chatapp());
  
}
class chatapp extends StatelessWidget {
  const chatapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
      
    );
  }
}

