import 'package:chat_app/Screens/Login_Screen.dart';
import 'package:chat_app/Screens/SignUp_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/Chat_Screen.dart';
import 'firebase_options.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const chatapp());
  
}
class chatapp extends StatelessWidget {
  const chatapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'LoginScrean': (context) =>   LoginScreen(),
        'SignUpScreen':(context) =>  const SignUpScreen(),
        'ChatScreen':(context) => const ChatScreen(),
      },
      initialRoute: 'LoginScrean',
      
    );
  }
}

