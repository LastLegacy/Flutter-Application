import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthenticationService {

  final FirebaseAuth _authentication;

  AuthenticationService(this._authentication);

  Stream<User> get authStateChanges => _authentication.idTokenChanges();

  //signing in
  Future<String> signIn({@required String email, @required String password}) async{
    try {
      await _authentication.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      print("Something aint right!");
      return e.message;
    }
  }

  Future<String> signUp({@required String email, @required String password}) async{
    try {
      await _authentication.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _authentication.signOut();
  }

}