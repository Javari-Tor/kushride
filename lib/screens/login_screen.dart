import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;
  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

// login method
  void login() async {
// authenticate user first
  try {
   final user = await _auth.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
   Fluttertoast.showToast(msg: 'Successfully logged in');
    // once authenticated, send user to homepage
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
    }catch(e){
    Fluttertoast.showToast(msg:"Invalid Credentials");
  }
  }

// forgot password
  void forgotPw() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("User tapped forgot password."),
      ),
    );
  }

// google sign in
  void googleSignIn() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("Login with Google?"),
        actions: [
// cancel
          MaterialButton(
            color: Theme.of(context).colorScheme.secondary,
            elevation: 0,
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),

// yes
          MaterialButton(
            color: Theme.of(context).colorScheme.secondary,
            elevation: 0,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            ),
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

// apple sign in
  void appleSignIn() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("Login with Apple?"),
        actions: [
// cancel
          MaterialButton(
            color: Theme.of(context).colorScheme.secondary,
            elevation: 0,
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),

// yes
          MaterialButton(
            color: Theme.of(context).colorScheme.secondary,
            elevation: 0,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            ),
            child: const Text("Yes"),
          ),
        ],
      ),
    );
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
                  Text(
                    'Welcome back you\'ve been missed!',
                    style: TextStyle(
                      color: darkTheme
                          ? Colors.amber.shade400
                          : Colors.grey.shade700,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // email textfield
                  MyTextField(
                    keyboard:TextInputType.emailAddress,
                    //controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                    onChange: (value ) {
                      setState(() {
                        emailController.text = value;
                      });
                    },
                    validation: null,
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  MyTextField(
                    keyboard: TextInputType.text,
                    //controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    onChange: (value ) {
                      setState(() {
                        passwordController.text = value;
                      });
                    },
                    validation: null,
                  ),

                  const SizedBox(height: 10),

                  // forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: forgotPw,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: darkTheme
                                  ? Colors.amber.shade400
                                  : Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // sign in button
                  MyButton(
                    onTap: login,
                    text: "Login",
                  ),

                  const SizedBox(height: 25),

                  // or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color:
                                darkTheme ? Colors.white : Colors.grey.shade700,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(
                              color: darkTheme
                                  ? Colors.amber.shade400
                                  : Colors.grey.shade700,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color:
                                darkTheme ? Colors.white : Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // google + apple sign in buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // google button
                      SquareTile(
                        onTap: googleSignIn,
                        child: Image.asset(
                          'images/google.png',
                          height: 25,
                        ),
                      ),

                      const SizedBox(width: 25),

                      // apple button
                      SquareTile(
                        onTap: appleSignIn,
                        child: Image.asset(
                          'images/apple.png',
                          height: 25,
                          color:
                              darkTheme ? Colors.grey.shade200 : Colors.black,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(
                            color: darkTheme
                                ? Colors.amber.shade400
                                : Colors.grey.shade600),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Register now',
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
