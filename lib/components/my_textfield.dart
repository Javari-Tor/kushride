import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final  TextInputType keyboard;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.keyboard
  });

  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        keyboardType: keyboard,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: darkTheme?Colors.white60:Colors.grey.shade500),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: darkTheme? Colors.amber.shade400:const Color(0xff2c9e4b)),
            ),
            fillColor: darkTheme? const Color(0xff414141):Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: darkTheme? Colors.white: Colors.black)),
      ),
    );
  }
}