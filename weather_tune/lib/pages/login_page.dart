import 'package:weather_tune/components/button.dart';
import 'package:weather_tune/components/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Text Editing Controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  // Sign User In
  void signIn() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    //try Sign In
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );

      //Pop loading circle
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop loading circle
      Navigator.pop(context);
      //display error message
      displayMessage(e.code);
      //
    }
  }

  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 1,
          decoration: BoxDecoration(
            color: const Color.fromARGB(78, 20, 24, 27),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'images/loginbackground.jpg',
              ).image,
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //logo
                    const Icon(
                      Icons.lock,
                      size: 100,
                    ),

                    const SizedBox(
                      height: 50,
                    ),

                    //welcome
                    const Text("Login",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 145, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 40)),

                    const SizedBox(
                      height: 25,
                    ),

                    MyTextField(
                        controller: emailTextController,
                        hintText: 'Email',
                        obscureText: false),

                    const SizedBox(
                      height: 10,
                    ),

                    MyTextField(
                        controller: passwordTextController,
                        hintText: 'Password',
                        obscureText: true),

                    const SizedBox(
                      height: 10,
                    ),

                    MyButton(onTap: signIn, text: 'Sign In'),

                    const SizedBox(
                      height: 25,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Not a member?",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            "Register now",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
