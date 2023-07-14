import 'package:chat_app/widgets/Custom_Button.dart';
import 'package:flutter/material.dart';

import '../widgets/Custom_TextField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: const Color(0xff2B475E),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          
          children: [
            const Spacer(
              flex: 1,
            ),
            Image.asset('assets/images/scholar.png'),

            const Text("Scholer Chat",
            style: TextStyle(color:Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold ,fontFamily: "Pacifico"),),
            const SizedBox(
              height: 25,
            ),
        
            Row(
              children: const [
                Text("LOGIN",
                style: TextStyle(color:Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold ,),),
              ],
              
            ),
             const SizedBox(
              height: 8,
            ),
        
             const CustomTextField(hintText: "email"),
              const SizedBox(
              height: 8,
            ),
             const CustomTextField(hintText: "password"),
              const SizedBox(
              height: 8,
            ),
             const CustomButton(ActionName:"LOGIN"),
              const SizedBox(
              height: 8,
            ), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
              Text("don't have account?",style: TextStyle(
                color: Colors.white,
              ),),
               Text(" Sign Up",style: TextStyle(
                color: Color.fromARGB(255, 155, 203, 203),
              ),)
            ],),
             const Spacer(
              flex: 2,
            ),
        
        ]),
      ),
    );
   
  }
}