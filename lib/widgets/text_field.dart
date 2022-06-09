import 'package:flutter/material.dart';
class MyTextField extends StatelessWidget{
  final String hintText;
  final bool obscureText;
  MyTextField({required this.hintText,required this.obscureText});
  @override
  Widget build(BuildContext context){
    return TextFormField(

      obscureText: obscureText,
      style: TextStyle(color: Colors.cyanAccent),
      decoration: InputDecoration(
        hintText: hintText,

        hintStyle: TextStyle(color: Colors.cyanAccent),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.cyanAccent),
        ),
      ),
    );
  }
}