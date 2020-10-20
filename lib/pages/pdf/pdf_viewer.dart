import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:pdf_gen/pages/landing_page.dart';
import 'package:pdf_gen/services/database.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:path/path.dart';

class PDFViewer extends StatelessWidget {
  final String path;

  const PDFViewer({Key key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return WillPopScope(
      onWillPop: () => Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LandingPage()),
          (Route<dynamic> route) => false),
      child: PDFViewerScaffold(
          appBar: AppBar(
            title: Text(basename(path)),
            automaticallyImplyLeading: false,
            actions: [
              FlatButton(
                  onPressed: () async {
                    try {
                      if (File(path).existsSync()) {
                        await Database()
                            .uploadPdfFile(File(path), user.email, user.uid);
                        print("success");
                      }
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                  child: Text("upload to db")),
              IconButton(
                onPressed: () async {
                  Share.shareFiles([path], text: path);
                },
                icon: Icon(Icons.share),
              )
            ],
          ),
          path: path),
    );
  }
}
