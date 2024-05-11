 import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
 //import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class MyPhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final  TextInputType keyboard;
  final void Function(PhoneNumber)? onChange;

  const MyPhoneField({super.key, 
    required this.controller,
    required this.hintText,
    required this.keyboard,
    this.onChange,
  });
  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: IntlPhoneField(
        showCountryFlag: false,
        dropdownIcon: Icon(
          Icons.arrow_drop_down,
          color: darkTheme
              ? Colors.amber.shade400
              : Colors.grey,
        ),
       onChanged:onChange,
        keyboardType: keyboard,
        //controller: controller,
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
        initialCountryCode: 'SS',
      ),
    );
  }
}
