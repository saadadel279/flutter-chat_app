import 'package:chat_app/widgets/Custom_Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/Custom_TextField.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
 String? email;

  String? password;

  GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: KPrimaryBackgraund,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Form(
          key: formKey,
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
                  
                  
                  if (formKey.currentState!.validate()) {
          try{  
            await loginUser();
            showSnackBar(context, 'Login Successful.');
          
            } on FirebaseAuthException catch (e) {
              if (e.code == 'user-not-found') {
               showSnackBar(context,"No user found for that email.");
              } else if (e.code == 'wrong-password') {
          showSnackBar(context, 'Wrong password provided for that user.');
            }
              }
          catch(e){
              print(e);
            }
        } else{
          
        }
        
                
                },
                ActionName:"LOGIN"),
                const SizedBox(
                height: 8,
              ), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                const Text("don't have account?",style: TextStyle(
                  color: Colors.white,
                ),),
                 GestureDetector(
                  onTap: () {
                   Navigator.pushNamed(context, 'SignUpScreen');
                  },
                   child: const Text(" Sign Up",style: TextStyle(
                    color: Color.fromARGB(255, 155, 203, 203),
                               ),),
                 )
              ],),
               const Spacer(
                flex: 2,
              ),
          
          ]),
        ),
      ),
    );
   
  }

  void showSnackBar(BuildContext context,String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),),);
  }

  Future<void> loginUser() async {
     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword( 
    email: email!, 
    password: password!);
  }
}
