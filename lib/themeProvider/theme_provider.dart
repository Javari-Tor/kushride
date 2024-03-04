import 'package:flutter/material.dart';
 class MyTheme {
   static final lightTheme = ThemeData(
       scaffoldBackgroundColor:Colors.white,
       colorScheme: const ColorScheme.light()
   );
   static final darkTheme = ThemeData(
       scaffoldBackgroundColor: const Color(0xff414141),
       colorScheme: const ColorScheme.dark()
   );
 }