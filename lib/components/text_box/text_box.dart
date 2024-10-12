import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget{
  final String labelText;
  final String hintText;
  //final TextEditingController controller;
  final bool isPassword;
  final TextInputType inputType;

  const MyTextBox({
    Key? key,
    required this.labelText,
    required this.hintText,
   // required this.controller,
    this.isPassword = false,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
       // controller: controller,
        obscureText: isPassword,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 15.0,
          ),
        ),
      ),
    );
  }

}