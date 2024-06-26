import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  //final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final int? length;
  final  TextInputType keyboard;
  final String? Function(String?)? validation;
  final void Function(String)? onChange;
  final Widget? iconWidget;

   const MyTextField({
    super.key,
     this.iconWidget,
     this.length,
     this.validation,
     required this.onChange,
     //required this.controller,
     required this.hintText,
     required this.obscureText,
     required this.keyboard,
  });
  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        onChanged:onChange,
        validator: validation,
        inputFormatters: [LengthLimitingTextInputFormatter(length)],
        autovalidateMode:AutovalidateMode.onUserInteraction,
        keyboardType: keyboard,
        //controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon:iconWidget,
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

