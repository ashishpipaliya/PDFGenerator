import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/models/usermodel.dart';
import 'package:pdf_gen/services/database.dart';

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Database _db = Database();

  // broadcast user
  Stream<User> get user => _auth.authStateChanges();

//Register using email and password
  Future signup(String email, String password) async {
    String errorMessage;
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      _db.createUser(UserModel(
        uid: userCredential.user.uid,
        firstName: 'firstname',
        lastname: 'lastname',
        email: userCredential.user.email,
        image: 'image',
        city: 'city',
        state: 'state',
        zip: 'zip',
        country: 'country',
        phoneNumber: 'phone',
        deviceId: 'device id',
        deviceType: 'device type',
        createdAt: 'created at',
      ));

      return userCredential.user != null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      if (errorMessage != null) {
        return errorMessage;
      }
    } catch (e) {
      return e.toString();
    }

    notifyListeners();
  }

  // Signin using email and password
  Future login(String email, String password) async {
    String errorMessage;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCredential.user != null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      if (errorMessage != null) {
        return errorMessage;
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  // Sign Out
  Future signOut() async {
    try {
      _auth.signOut();
    } catch (e) {
      print("Error signing out");
      return null;
    }
    notifyListeners();
  }

//end
}
