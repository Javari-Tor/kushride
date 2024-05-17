import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kushride/global/global.dart';
import 'package:kushride/screens/login_screen.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _submit() {
    firebaseAuth
        .sendPasswordResetEmail(email: emailController.text.trim())
        .then((value) => Fluttertoast.showToast(
            msg:
                'We have sent an email to recover your password, please check your email.'))
        .onError((error, stackTrace) => Fluttertoast.showToast(
            msg: 'Error Occurred:\n ${error.toString()}'));
  }

  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: darkTheme ? const Color(0xff313131) : Colors.white,
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),

                  // logo
                  Image.asset(
                    'images/unlock.png',
                    height: 100,
                    color: darkTheme
                        ? Colors.amber.shade400
                        : Colors.grey.shade700,
                  ),

                  const SizedBox(height: 50),

                  // welcome back, you've been missed!
                  // Text(
                  //   'Welcome back you\'ve been missed!',
                  //   style: TextStyle(
                  //     color: darkTheme
                  //         ? Colors.amber.shade400
                  //         : Colors.grey.shade700,
                  //     fontSize: 16,
                  //   ),
                  // ),
                  //
                  // const SizedBox(height: 25),

                  // email textfield
                  MyTextField(
                    keyboard: TextInputType.emailAddress,
                    //controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                    onChange: (value) {
                      setState(() {
                        emailController.text = value;
                      });
                    },
                    validation: null,
                  ),

                  // const SizedBox(height: 10),
                  //
                  // // password textfield
                  // MyTextField(
                  //   keyboard: TextInputType.text,
                  //   //controller: passwordController,
                  //   hintText: 'Password',
                  //   obscureText: true,
                  //   onChange: (value) {
                  //     setState(() {
                  //       passwordController.text = value;
                  //     });
                  //   },
                  //   validation: null,
                  // ),

                  // const SizedBox(height: 10),

                  // forgot password?

                  const SizedBox(height: 25),

                  // sign in button
                  MyButton(
                    onTap: _submit,
                    text: "Reset Password",
                  ),

                  const SizedBox(height: 25),

                  //  or continue with
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: Divider(
                  //           thickness: 0.5,
                  //           color:
                  //           darkTheme ? Colors.white : Colors.grey.shade700,
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  //         child: Text(
                  //           'Or continue with',
                  //           style: TextStyle(
                  //             color: darkTheme
                  //                 ? Colors.amber.shade400
                  //                 : Colors.grey.shade700,
                  //           ),
                  //         ),
                  //       ),
                  //       Expanded(
                  //         child: Divider(
                  //           thickness: 0.5,
                  //           color:
                  //           darkTheme ? Colors.white : Colors.grey.shade700,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(height: 25),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                            color: darkTheme
                                ? Colors.amber.shade400
                                : Colors.grey.shade600),
                      ),
                      const SizedBox(width: 4),
                  GestureDetector(
                    onTap: (){Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );},
                    //widget.onTap,
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        //color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
