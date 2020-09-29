import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/models/usermodel.dart';
import 'package:pdf_gen/services/database.dart';
import 'package:pdf_gen/widgets/textfield_widget.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Database _db = Database();
  UserModel user;

  @override
  void initState() {
    super.initState();
  }

  _getUserData(String email) async {
    final userData = await _db.getUserData(email);
    setState(() {
      user = userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userr = Provider.of<User>(context);
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
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  print("change profile");
                },
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://firebasestorage.googleapis.com/v0/b/pdf-generator-605e0.appspot.com/o/common_profile%2Fmale.png?alt=media&token=c77bda21-31be-40d5-bb4f-c491eefb0d88"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                'Ashish Pipaliya',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 50),
              Text("Email"),
              heightGap(),
              Text("Phone"),
              // heightGap(),
              // ButtonWidget(
              //     title: 'Cancel', hasBorder: false, onPressed: () {}),
              // heightGap(),
              // ButtonWidget(title: 'Save', hasBorder: true, onPressed: () {}),
              // heightGap(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget heightGap() {
  return SizedBox(height: 20);
}

Widget widthGap() {
  return SizedBox(width: 15);
}
