import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pdf_gen/models/usermodel.dart';
import 'package:pdf_gen/utils/logger.dart';

class Database {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future createUser(UserModel userModel) async {
    try {
      await FirebaseFirestore.instance
          .collection(userModel.email)
          .doc('profile')
          .set(userModel.toJson());
    } catch (e) {
      Logger().d(e.message);
    }
  }

  Future<UserModel> getUserData(String uid, String email) async {
    var docSnapshot = await _db.collection(email).doc('profile').get();
    return UserModel.fromFirestore(docSnapshot);
  }
}
