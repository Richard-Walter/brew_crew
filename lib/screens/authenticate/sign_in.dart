import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/models/MyUser.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0, //remove drop shadow
        title: Text('SIgn in to Brew Crew'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[200], foregroundColor: Colors.black),
            onPressed: () async {
              MyUser? user = await _auth.signInAnon();

              if (user == null) {
                print('Error signing in');
              } else {
                print('Signed in');
                print(user.uid);
              }
            },
            child: const Text('Sign in anon'),
          )),
    );
  }
}
