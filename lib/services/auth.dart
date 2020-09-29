import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/models/usermodel.dart';
import 'package:pdf_gen/services/database.dart';
import 'package:pdf_gen/utils/device_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    String errorMessage;

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await _db.createUser(
        UserModel(
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
          createdAtServer: FieldValue.serverTimestamp(),
          createdAtClient: DateTime.now(),
        ),
      );

      // store userdata locally using sharedprefs
      SharedPreferences prefs = await SharedPreferences.getInstance();
      try {
        await prefs.setString('userEmail', email);
      } catch (e) {
        return e.message;
      }

      // verify mail
      try {
        await userCredential.user.sendEmailVerification();
        return userCredential.user.uid;
      } catch (e) {
        print("An error occured while trying to send email verification");
        print(e.message);
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

      if (userCredential.user != null) {
        // store userdata locally using sharedprefs
        SharedPreferences prefs = await SharedPreferences.getInstance();
        try {
          await prefs.setString('userEmail', email);
        } catch (e) {
          return e.message;
        }
      }
      return userCredential.user != null;
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  // Sign Out
  Future signOut() async {
    try {
      _auth.signOut();

      // remove userdata from sharedprefs
      SharedPreferences prefs = await SharedPreferences.getInstance();
      try {
        await prefs.remove('userEmail');
      } catch (e) {
        return e.message;
      }
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
      return e.message;
    }
  }

//end
}
