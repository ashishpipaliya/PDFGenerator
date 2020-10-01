import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/models/usermodel.dart';
import 'package:pdf_gen/services/database.dart';
import 'package:pdf_gen/utils/device_util.dart';

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Database _db = Database();

  // broadcast user
  Stream<User> get user => _auth.authStateChanges();

//Register using email and password

  Future signup(
    String firstName,
    String lastName,
    String email,
    String password,
    String city,
    String state,
    String zip,
    String county,
    String phone,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // store user values to database
      UserModel userModel = UserModel(
        uid: userCredential.user.uid,
        firstName: firstName,
        lastname: lastName,
        email: userCredential.user.email,
        // image: 'image',
        city: city,
        state: state,
        zip: zip,
        country: county,
        phoneNumber: phone,
        deviceType: DeviceUtil().deviceType,
        createdAtServer: Timestamp.now(),
        createdAtClient: Timestamp.fromMillisecondsSinceEpoch(
            DateTime.now().millisecondsSinceEpoch),
      );
      await _db.createUser(userModel);

      // verify mail
      try {
        await userCredential.user.sendEmailVerification();
        return userCredential.user.uid;
      } catch (e) {
        print("An error occured while trying to send email verification");
        print(e.toString());
      }

      return userCredential.user != null;
    } catch (e) {
      return e.toString();
    }
  }

  // Sign in using email and password
  Future login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCredential.user != null;
    } catch (e) {
      print(e.toString());
    }
  }

  // Sign Out
  Future signOut() async {
    try {
      final result = _auth.signOut();
      return result == null;
    } catch (e) {
      print("Error signing out");
      return null;
    }
    notifyListeners();
  }

  Future resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email,
      );
    } catch (e) {
      return e.toString();
    }
  }
}
