import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:pdf_gen/pages/form_page/form_page.dart';
import 'package:pdf_gen/pages/form_page/widgets.dart';
import 'package:pdf_gen/pages/pdf/pdf_viewer.dart';
import 'package:pdf_gen/pages/profile.dart';
import 'package:pdf_gen/services/auth.dart';
import 'package:pdf_gen/services/mailer.dart';
import 'package:pdf_gen/services/validation.dart';
import 'package:pdf_gen/shared/color_palette.dart';
import 'package:share/share.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String directory;
  List file = new List();
  @override
  void initState() {
    super.initState();
    _generatedPDFList();
  }

  void _generatedPDFList() async {
    directory = (await getApplicationDocumentsDirectory()).path;
    setState(() {
      file = io.Directory("$directory/").listSync(recursive: true);
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "CENTRAL GOVERNMENT HEALTH SCHEME",
          style: TextStyle(fontSize: 13),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Container(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              RaisedButton(
                                child: Text(
                                  "Profile",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: ColorPalette.darkPurple,
                                onPressed: () {
                                  if (Navigator.of(context).canPop()) {
                                    Navigator.pop(context);
                                  }
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile()));
                                },
                              ),
                              RaisedButton(
                                onPressed: () async {
                                  await AuthProvider().signOut();
                                  if (Navigator.of(context).canPop()) {
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text(
                                  "Sign out",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: ColorPalette.darkPurple,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // your Content if there
            Expanded(
              child: ListView.builder(
                  itemCount: file.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    final currentFile = file[index];
                    var pdfPath = currentFile
                        .toString()
                        .replaceFirst("File: ", "")
                        .replaceAll("'", "");

                    final fileName = basename(pdfPath);

                    return isFilePdf(pdfPath)
                        ? Container(
                            height: 100,
                            child: Card(
                              child: InkWell(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => PDFViewer(path: pdfPath),
                                  ),
                                ),
                                child: Center(
                                  child: ListTile(
                                    title: Text(fileName),
                                    subtitle: Text(
                                        "created : ${fileName.split("T")[0]}"),
                                    dense: false,
                                    leading: Image.asset("assets/pdflogo.png"),
                                    trailing: IconButton(
                                      icon: Icon(Icons.more_vert),
                                      onPressed: () {
                                        _menuBottomSheet(context, currentFile);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink();
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormPage(),
            )),
        label: Text("Create"),
        icon: Icon(Icons.add),
      ),
    );
  }

  bool isFilePdf(String path) {
    RegExp pdfRegex = RegExp(r'\.pdf$');
    return pdfRegex.hasMatch(path);
  }

  void _menuBottomSheet(BuildContext context, File currentFile) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                Container(
                    color: ColorPalette.superlightPurple,
                    child: ListTile(
                      title: Text(basename(currentFile.path)),
                    )),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Delete'),
                  onTap: () {
                    currentFile.deleteSync(recursive: true);
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                    _generatedPDFList();
                  },
                ),
                ListTile(
                  leading: new Icon(Icons.share),
                  title: new Text('Share'),
                  onTap: () {
                    Share.shareFiles([currentFile.path],
                        text: currentFile.path);
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                ),
                ListTile(
                  leading: new Icon(Icons.mail),
                  title: new Text('Send via Email'),
                  onTap: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                    var sendEmailAddress;
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) => Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Container(
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      FormFieldWidget(
                                          onChanged: (value) =>
                                              sendEmailAddress = value,
                                          labelText: "Enter an email",
                                          maxLines: 1,
                                          validator: (value) =>
                                              Validator().emailValidator(value),
                                          keyboardType:
                                              TextInputType.emailAddress),
                                      FlatButton.icon(
                                        onPressed: () async {
                                          if (_formKey.currentState
                                              .validate()) {
                                            if (Navigator.canPop(context)) {
                                              Navigator.pop(context);
                                            }
                                            try {
                                              _scaffoldKey.currentState
                                                  .showSnackBar(SnackBar(
                                                content: Text("Sending Email"),
                                                backgroundColor:
                                                    ColorPalette.darkPurple,
                                                duration: Duration(seconds: 3),
                                              ));
                                              await sendMail(sendEmailAddress,
                                                  currentFile.path);
                                              _scaffoldKey.currentState
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Email sent Successfully"),
                                                backgroundColor:
                                                    ColorPalette.darkPurple,
                                                duration: Duration(seconds: 2),
                                              ));
                                            } catch (e) {
                                              _scaffoldKey.currentState
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Failed to send Email"),
                                                backgroundColor:
                                                    ColorPalette.darkPurple,
                                                duration: Duration(seconds: 3),
                                              ));
                                            }
                                          }
                                        },
                                        icon: Icon(Icons.send),
                                        color: ColorPalette.darkPurple,
                                        textColor: ColorPalette.white,
                                        label: Text("Send"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )));
                  },
                ),
              ],
            ),
          );
        });
  }
}

//  pdf file path :  file[index].toString().replaceFirst("File: ", "")
//  pdf file name :  file[index].toString().replaceFirst("File: '/data/user/0/app.pdf_gen/app_flutter/","'")
// path  : "File: '/data/user/0/app.pdf_gen/app_flutter/" + ""
