import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
    CustomButton({Key? key, this.ActionName,required this.onTap}) : super(key: key);
final String? ActionName;
VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: const BoxDecoration(
          
          color: Colors.white
        ),
        child: Center(child: Text(ActionName??"",style: const TextStyle(
          fontWeight: FontWeight.bold,fontSize: 18,
        ),)),
      ),
    );
  }
}