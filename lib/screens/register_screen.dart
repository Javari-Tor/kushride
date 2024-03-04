import 'package:flutter/material.dart';
//import 'package:kushride/constants/constants.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import 'home_page.dart';

class RegisterScreen extends StatelessWidget {
  final void Function()? onTap;
  const RegisterScreen({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    // text editing controllers
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final phoneController = TextEditingController();
    // register method
    void register() {
      // create user account first

      // once created, send user to homepage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }

    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SafeArea(
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: darkTheme? const Color(0xff313131):Colors.white,
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    darkTheme ? 'images/darkCity.jpg' : 'images/light_city.jpg',
                  ),
                  SizedBox(height: screenHeight*0.02),
                  Text(
                    'Let\'s create an account for you',
                    style: TextStyle(
                      color: darkTheme? Colors.amber.shade400: Colors.grey.shade700,
                      fontSize: 16,
                    ),
                  ),

                  SizedBox(height:screenHeight* 0.025),

                  // email textfield
                  MyTextField(
                    keyboard: TextInputType.emailAddress,
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  SizedBox(height:screenHeight* 0.01),

                  MyTextField(
                      keyboard: TextInputType.phone,
                      controller: phoneController,
                      hintText: '0923464654',
                      obscureText: false),

                  SizedBox(height:screenHeight* 0.01),

                  // password textfield
                  MyTextField(
                    keyboard: TextInputType.text,
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                   SizedBox(height:screenHeight* 0.01),

                  // confirm password textfield
                  MyTextField(
                    keyboard: TextInputType.text,
                    controller: confirmPasswordController,
                    hintText: 'Confirm password',
                    obscureText: true,
                  ),

                   SizedBox(height: screenHeight*0.025),

                  // sign in button
                  MyButton(
                    onTap: register,
                    text: "Sign Up",
                  ),

                   SizedBox(height:screenHeight*0.04),

                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member?',
                        style:
                        TextStyle(color: darkTheme? Colors.amber.shade400:Colors.grey.shade700),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: onTap,
                        child: const Text(
                          'Login now',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],

          ),
        ),
      ),
    );
  }
}
