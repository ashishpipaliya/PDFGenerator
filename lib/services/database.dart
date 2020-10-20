import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf_gen/models/usermodel.dart';
import 'package:pdf_gen/shared/color_palette.dart';
import 'package:pdf_gen/utils/logger.dart';
import 'package:path/path.dart';

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

  uploadFile(String uid, String email) async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile _pickedFile;
    File _croppedFile;

    _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      var file = File(_pickedFile.path);
      _croppedFile = await ImageCropper.cropImage(
        sourcePath: _pickedFile.path,
        cropStyle: CropStyle.circle,
        maxHeight: 500,
        maxWidth: 500,
        aspectRatioPresets: [CropAspectRatioPreset.square],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Adjust Image',
            toolbarColor: ColorPalette.darkPurple,
            activeControlsWidgetColor: ColorPalette.darkPurple,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            hideBottomControls: true,
            lockAspectRatio: true),
      );

      var snapshot = await _storage
          .ref()
          .child('profile_pictures/$uid.jpeg')
          .putFile(_croppedFile ?? file)
          .onComplete;

      var imageUrl = await snapshot.ref.getDownloadURL();
      print(imageUrl);

      try {
        await FirebaseFirestore.instance.collection('users').doc(email).update(
          {"image": "$imageUrl"},
        );

        Logger().d('image added to firebase');
      } catch (e) {
        Logger().d(e.toString());
      }

      return _croppedFile ?? file;
    } else {
      print("No image selected");
    }
  }

  uploadPdfFile(File pdfPath, String email, String uid) async {
    final _storage = FirebaseStorage.instance;

    var snapshot = await _storage
        .ref()
        .child('pdf/$email/${basename(pdfPath.path)}')
        .putFile(pdfPath)
        .onComplete;

    var pdfUrl = await snapshot.ref.getDownloadURL();

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(email)
          .collection("pdf")
          .doc(basename(pdfPath.path))
          .set({"name": basename(pdfPath.path), "url": pdfUrl});

      Logger().d('pdf added to firebase');
    } catch (e) {
      Logger().d(e.toString());
    }
  }
}
