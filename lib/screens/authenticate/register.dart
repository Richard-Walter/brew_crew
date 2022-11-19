import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/models/MyUser.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/logger.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({super.key, required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final Register = GlobalKey<FormState>(); //associate our form with this key

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0, //remove drop shadow
          title: const Text('Sign up to Brew Crew'),
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign In'),
              onPressed: () {
                // this.toggleView();  //wont work as it refers to the state object
                widget.toggleView(); //wont work as it refers to the state object
              },
              style: TextButton.styleFrom(foregroundColor: Colors.black),
            ),
          ],
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: Form(
                key: Register, //keeps track and state of the form.  Useful for validation
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),

                    //email address
                    TextFormField(
                      //return null if field is valid, otherwise error message
                      validator: (value) => value!.isEmpty ? 'Enter an email' : null,
                      onChanged: (value) {
                        setState(() => email = value);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //password
                    TextFormField(
                      validator: (value) => value!.length < 6 ? 'Enter a password 6+ chars long' : null,
                      onChanged: (value) {
                        setState(() => password = value);
                      },
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (Register.currentState?.validate() == true) {
                          MyUser? result = await _auth.registerWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'Please supply valid email address';
                            });
                          }
                        }
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.pink[400]),
                      child: const Text('Register'),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    )
                  ],
                ))));
  }
}
