import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/pages/homepage.dart';
import 'package:pdf_gen/pages/login_redesign.dart';
import 'package:pdf_gen/services/auth.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    bool loggedIn = user != null;

    return !loggedIn ? LoginRedesign() : HomePage();
  }
}
