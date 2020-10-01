import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pdf_gen/models/usermodel.dart';
import 'package:pdf_gen/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;

class Database {
  // signup
  Future createUser(UserModel userModel) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userModel.email)
          .set(userModel.toJson());
      Logger().d('${userModel.uid} created');
    } catch (e) {
      Logger().d(e.toString());
    }
  }

// Future<UserModel> saveInfo(UserModel userModel) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   var docSnapshot =
  //       await _db.collection(userModel.email).doc('profile').get();
  //   Map userMap = UserModel.fromFirestore(docSnapshot).toJson();
  //   print("mapdata : $userMap");
  //   prefs.setString("userData", userMap.toString());
  // }
  //
  // Future<UserModel> getSavedInfo(String email) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final json = jsonDecode(prefs.getString('userData'));
  //   print(json);
  //   var user = UserModel.fromJson(json);
  //   print(user);
  //   return user;
  // }

  // // profile details
  // Future<UserModel> storeUserData(String email) async {
  //   try {
  //     var docSnapshot = await _db.collection(email).doc('profile').get();
  //
  //     final response = UserModel.fromFirestore(docSnapshot);
  //
  //     // save data to shared preference
  //     Map<String, String> userdata = {
  //       "firstName": response.firstName,
  //       "lastName": response.lastname,
  //       "email": response.email,
  //       "image": response.image,
  //       "phoneNumber": response.phoneNumber,
  //       "city": response.city,
  //       "state": response.state,
  //       "zip": response.zip,
  //       "country": response.country
  //     };
  //     SharedPreferences _prefs = await SharedPreferences.getInstance();
  //     _prefs.setString('userData', userdata.toString());
  //
  //     return UserModel.fromFirestore(docSnapshot);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
