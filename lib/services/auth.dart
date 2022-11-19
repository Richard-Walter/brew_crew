import 'package:brew_crew/models/MyUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger(
    printer: PrettyPrinter(
  methodCount: 0,
  errorMethodCount: 5,
  lineLength: 50,
  colors: true,
  printEmojis: true,
  printTime: true,
));

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create myuser object based on firebase user
  MyUser? _userFromFirebaseUser(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<MyUser?> get user {
    return _auth.authStateChanges()
    // .map((User? user) => _userFromFirebaseUser(user));
    .map(_userFromFirebaseUser);  // shorthand for above
  }

  //sign in anonymous
  Future<MyUser?> signInAnon() async {
    logger.d("Test logger!");
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      logger.e("[ClassName] Method Name: This is how I debug!", e.toString());
      return null;
    }
  }

  //sign in email/password

  //sign out

}
