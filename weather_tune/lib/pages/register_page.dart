// ignore_for_file: use_build_context_synchronously

import 'package:weather_tune/components/login_page/button.dart';
import 'package:weather_tune/components/login_page/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Text Editing Controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  void signUp() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    //make sure passwords match
    if (passwordTextController.text != confirmPasswordTextController.text) {
      Navigator.pop(context);
      //show error to user
      displayMessage("Passwords don't match!");
      return;
    }

    //try creating user
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController.text);
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop loading circle
      Navigator.pop(context);
      //show error to user
      displayMessage(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 1,
          decoration: BoxDecoration(
            color: const Color.fromARGB(78, 20, 24, 27),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                "images/registerbackground.jpg",
              ).image,
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      //color: const Color.fromARGB(41, 255, 255, 255),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(40)),
                  height: MediaQuery.of(context).size.height - 200,
                  width: MediaQuery.of(context).size.width - 100,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Register",
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

                        MyTextField(
                            controller: confirmPasswordTextController,
                            hintText: 'Confirm Password',
                            obscureText: true),

                        const SizedBox(
                          height: 10,
                        ),

                        //sign up button
                        MyButton(onTap: signUp, text: 'Sign Up'),

                        const SizedBox(
                          height: 25,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: const Text(
                                "Login now",
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
              ),
            ),
          ),
        ));
  }
}
