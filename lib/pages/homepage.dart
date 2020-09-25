import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_gen/services/auth/auth.dart';
import 'file:///C:/Users/ashis/Documents/Flutter/Agile%20Infoways/pdf_gen/lib/pages/profile.dart';
import 'package:pdf_gen/shared/color_palette.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthProvider _auth = AuthProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF"),
      ),
      body: Center(
        child: Column(
          children: [
            FlatButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile())),
                child: Text("Edit profile")),
            FlatButton(
              onPressed: () => _auth.signOut(),
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
