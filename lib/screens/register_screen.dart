import 'package:email_validator/email_validator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kushride/global/global.dart';
import 'package:kushride/screens/login_screen.dart';
import '../components/my_button.dart';
import '../components/my_phonefield.dart';
import '../components/my_textfield.dart';
import 'splash_screen.dart';


class RegisterScreen extends StatefulWidget {
  // final void Function()? onTap;
  const RegisterScreen({super.key,});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // text editing controllers
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();

  // register method
  void register() async {
    // create user account first
    if (_formKey.currentState!.validate()) {
      await firebaseAuth
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((auth) async => currentUser = auth.user);
      if (currentUser != null) {
        Map userMap = {
          'id': currentUser!.uid,
          'name': nameController.text.trim(),
          'email': emailController.text.trim(),
          'phone': phoneController.text.trim(),
          'address': addressController.text.trim(),
        };
        DatabaseReference userRef =
            FirebaseDatabase.instance.ref().child('users');
        userRef.child(currentUser!.uid).set(userMap);
      }
      await Fluttertoast.showToast(msg: "Successfully Registered");
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );// once created, send user to homepage
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: darkTheme ? const Color(0xff313131) : Colors.white,
          body: ListView(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      darkTheme
                          ? 'images/darkCity.jpg'
                          : 'images/light_city.jpg',
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Let\'s create an account for you',
                      style: TextStyle(
                        color: darkTheme
                            ? Colors.amber.shade400
                            : Colors.grey.shade700,
                        fontSize: 16,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.025),
                    // name textfield
                    MyTextField(
                        onChange: (text) {
                          setState(() {
                            nameController.text = text;
                          });
                        },
                        //controller: nameController,
                        length: 50,
                        hintText: 'Name',
                        obscureText: false,
                        keyboard: TextInputType.text,
                        validation: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Name can\'t be empty';
                          }
                          if (text.length < 2) {
                            return "Name can't be less than 3 letters";
                          }
                          if (text.length > 49) {
                            return 'Name can\'t be more than 50 letters';
                          }
                          return null;
                        }),

                    SizedBox(height: screenHeight * 0.01),

                    // email textfield
                    MyTextField(
                      length: 100,
                      keyboard: TextInputType.emailAddress,
                      //controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                      onChange: (text) {
                        setState(() {
                          emailController.text = text;
                        });
                      },
                      validation: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Email can\'t be empty';
                        }
                        if (EmailValidator.validate(text) == true) {
                          //return null;
                        }
                        if (text.length < 4) {
                          return "Please enter a valid email";
                        }
                        if (text.length > 99) {
                          return 'Email; can\'t be more than 100 letters';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: screenHeight * 0.01),
                    MyPhoneField(
                      keyboard: TextInputType.phone,
                      controller: phoneController,
                      hintText: 'Phone Number',
                      onChange: (text) {
                        setState(() {
                          phoneController.text = text.completeNumber;
                        });
                      },
                    ),

                    SizedBox(height: screenHeight * 0.01),

                    // address textfield
                    MyTextField(
                      keyboard: TextInputType.text,
                      //controller: addressController,
                      hintText: 'Address',
                      obscureText: false,
                      onChange: (text) {
                        setState(() {
                          addressController.text = text;
                        });
                      },
                      validation: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Address can\'t be empty';
                        }
                        if (text.length < 3) {
                          return 'Please enter a valid address';
                        }
                        if (text.length > 99) {
                          return 'Address can\'t be more  than 100 letters';
                        }
                        return null;
                      },
                      length: 100,
                    ),

                    SizedBox(height: screenHeight * 0.01),

                    // password textfield
                    MyTextField(
                      keyboard: TextInputType.text,
                      //controller: passwordController,
                      iconWidget: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon: Icon(_passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      hintText: 'Password',
                      obscureText: !_passwordVisible,
                      onChange: (text) {
                        setState(() {
                          passwordController.text = text;
                        });
                      },
                      validation: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Password can\'t be empty';
                        }
                        if (text.length < 6) {
                          return 'Please enter valid password';
                        }
                        if (text.length > 49) {
                          return 'Password can\'t be more than 50 characters';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: screenHeight * 0.01),

                    // confirm password textfield
                    MyTextField(
                      keyboard: TextInputType.text,
                      //controller: confirmPasswordController,
                      hintText: 'Confirm password',
                      obscureText: !_passwordVisible,
                      iconWidget: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(_passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      onChange: (text) {
                        setState(() {
                          confirmPasswordController.text = text;
                        });
                      },
                      validation: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Confirm password can\'t be empty';
                        }
                        if (text != passwordController.text) {
                          return 'Password do not match';
                        }
                        if (text.length < 6) {
                          return 'Please enter valid password';
                        }
                        if (text.length > 49) {
                          return 'Password can\'t be more than 50 characters';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: screenHeight * 0.025),

                    // sign in button
                    MyButton(
                      onTap: () {
                        register();
                      },
                      text: "Sign Up",
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // not a member? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already a member?',
                          style: TextStyle(
                              color: darkTheme
                                  ? Colors.amber.shade400
                                  : Colors.grey.shade700),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        GestureDetector(
                          onTap:(){Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );},
                          //widget.onTap,
                          child: const Text(
                            'Login now',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
