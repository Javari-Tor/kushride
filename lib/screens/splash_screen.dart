import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kushride/assistants/assistant_methods.dart';
import 'package:kushride/global/global.dart';
import 'package:kushride/screens/login_screen.dart';
import 'package:kushride/screens/main_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
startTimer(){
  Timer(Duration(seconds:3),() async {
    if( await firebaseAuth.currentUser != null){
      firebaseAuth.currentUser != null ? AssistantMethods.readCurrentOnlineUserInfo() : null;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
      );
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),
        ),
      );
    }
  });
}
@override
void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'KUSH ',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              Text(
                'RIDE',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
              ),
            ],
          ),
        ));
  }
}
