import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_tune/auth/login_register.dart';
import 'package:weather_tune/main.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //User Logged In
            if (snapshot.hasData) {
              return const Api_Enabled();
            }
            //User NOT Logged In
            else {
              return const LoginOrRegister();
            }
          }),
    );
  }
}
