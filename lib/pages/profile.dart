import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/models/usermodel.dart';
import 'package:pdf_gen/services/database.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          leading: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.of(context).pop();
                }
              }),
        ),
        body: Scaffold(
          body: Container(
            child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc("${user.email}")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final userdata = UserModel.fromFirestore(snapshot.data);
                  return Column(
                    children: [
                      Text(userdata.email),
                      Text(userdata.firstName),
                      Text(userdata.lastname),
                      Text(userdata.phoneNumber),
                      Text(userdata.city),
                    ],
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ));
  }
}

Widget heightGap() {
  return SizedBox(height: 20);
}

Widget widthGap() {
  return SizedBox(width: 15);
}
