import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:share/share.dart';

class PDFViewer extends StatelessWidget {
  final String path;

  const PDFViewer({Key key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text(path),
          actions: [
            IconButton(
              onPressed: () async {
                Share.shareFiles([path], text: path);
              },
              icon: Icon(Icons.share),
            )
          ],
        ),
        path: path);
  }
}
