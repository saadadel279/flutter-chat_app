import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/Custom_Button.dart';
import '../widgets/Custom_TextField.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: KPrimaryBackgraund,
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
                Text("Sign Up",
                style: TextStyle(color:Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold ,),),
              ],
              
            ),
             const SizedBox(
              height: 8,
            ),
        
              CustomTextField(
                onChanged: (data) {
                  email=data;
                },
                hintText: "email"),
              const SizedBox(
              height: 8,
            ),
              CustomTextField(
                onChanged: (data) {
                  password=data;
                },
                hintText: "password"),
              const SizedBox(
              height: 8,
            ),
              CustomButton(
              onTap: ()async {
                
                
                try{  
                  await regesterUser();
                  showSnackBar(context, 'Successful registration.');

                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                     showSnackBar(context,"weak password ,Password should be at least 6 characters");
                    } else if (e.code == 'email-already-in-use') {
                      showSnackBar(context, 'The account already exists for that email.');
                  }
                    }
                catch(e){
                    print(e);
                  }

              
              },
              ActionName:"Sign Up"),
              const SizedBox(
              height: 8,
            ), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
              const Text("already have account?",style: TextStyle(
                color: Colors.white,
              ),),
               GestureDetector(
                onTap: () {
                 Navigator.pop(context);
                },
                 child: const Text(" Log in",style: TextStyle(
                  color: Color.fromARGB(255, 155, 203, 203),
                             ),),
               )
            ],),
             const Spacer(
              flex: 2,
            ),
        
        ]),
      ),
    );
   
  }

  void showSnackBar(BuildContext context,String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),),);
  }

  Future<void> regesterUser() async {
     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword( 
    email: email!, 
    password: password!);
  }
  }
