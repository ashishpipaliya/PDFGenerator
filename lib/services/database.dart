import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
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
      Logger().d('${userModel.uid} created');
    } catch (e) {
      Logger().d(e.message);
    }
  }

  Future<UserModel> getUserData(String uid, String email) async {
    var docSnapshot = await _db.collection(email).doc('profile').get();
    return UserModel.fromFirestore(docSnapshot);
  }

  File _imageFile;
  pickImage(ImageSource source) async {
    File image = await ImagePicker.pickImage(
      source: source,
      imageQuality: 50,
    );
    _imageFile = image;
  }

  void clear() {
    _imageFile = null;
  }
}
