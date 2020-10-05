import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/pages/profile.dart';
import 'package:pdf_gen/services/auth.dart';
import 'package:pdf_gen/services/database.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthProvider _auth = AuthProvider();
  Database _db = Database();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
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
