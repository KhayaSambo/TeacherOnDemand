
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'views/login_screen.dart';


class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

 
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();


  Future<void> signOut() async { 
    await _firebaseAuth.signOut();
    
  }

  Future<void> signIn({String email, String password}) async
  {
      try{
        await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        return "Do IT" ;
      }on FirebaseAuthException catch (e){
          print('You Failed');
          return e.message; 
          
      }
      
  }

  Future<void> signUp({String displayName, String school, String role, String email, String password, BuildContext context}) async
  {
      try{
        CollectionReference users = FirebaseFirestore.instance.collection('users');
        User user = (await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user;
        user.sendEmailVerification();
        users.add({'displayName': displayName, 'school': school, 'role': role});
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));

        return "Signed up!";
      }on FirebaseAuthException catch (e){
          print('You Failed');
          return e.message; 
          
      }
  }
}

