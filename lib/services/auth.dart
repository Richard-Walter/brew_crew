import 'package:brew_crew/models/MyUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/logger.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create myuser object based on firebase user
  MyUser? _userFromFirebaseUser(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<MyUser?> get user {
    return _auth
        .authStateChanges()
        // .map((User? user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser); // shorthand for above
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
  Future<MyUser?> signInWithEmailAndPassword(String email, String password) async {
    logger.i("Register User");

    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      logger.e("Error Signing in", e.toString());
      return null;
    }
  }

  

  //Register new user
  Future<MyUser?> registerWithEmailAndPassword(String email, String password) async {
    logger.i("Register User");

    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      logger.e("Error registering new user", e.toString());
      return null;
    }
  }

  //sign out
  Future<void> signOut() async {

    logger.d("Signing out user");

    try {
      return await _auth.signOut();
    } catch (e) {
      logger.e(" Error logging out", e.toString());
    }
  }
}
