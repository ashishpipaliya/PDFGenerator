import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_gen/pages/pdf/pdf_viewer.dart';

class FetchAndStorePdf {
  getFileFromUrl(BuildContext context, String pdfUrl, String pdfName) async {
    try {
      var data = await http.get(pdfUrl);
      var bytes = data.bodyBytes;
      final String dir = (await getApplicationDocumentsDirectory()).path;
      String pdfPath = "$dir/$pdfName";
      File file = File(pdfPath);
      await file.writeAsBytes(bytes);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PDFViewer(path: pdfPath),
          ));

      return pdfPath;
    } catch (e) {
      print(e.toString());
    }
  }
}
