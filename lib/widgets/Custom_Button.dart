import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   const CustomButton({Key? key, this.ActionName}) : super(key: key);
final String? ActionName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: const BoxDecoration(
        
        color: Colors.white
      ),
      child: Center(child: Text(ActionName??"",style: const TextStyle(
        fontWeight: FontWeight.bold,fontSize: 18,
      ),)),
    );
  }
}