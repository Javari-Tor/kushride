import 'package:flutter/material.dart';
import 'package:kushride/auth/login_or_register.dart';
//import 'package:kushride/screens/home_page.dart';
import 'package:kushride/themeProvider/theme_provider.dart';

void main() {
  runApp(const MyApp()
  );
}class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home:const LoginOrRegister()
    );
  }
}
