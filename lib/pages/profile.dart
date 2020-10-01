import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf_gen/models/usermodel.dart';
import 'package:pdf_gen/services/database.dart';
import 'package:pdf_gen/shared/color_palette.dart';
import 'package:pdf_gen/utils/device_util.dart';
import 'package:pdf_gen/utils/ui_utils.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final height = UIUtils().size(context).height;
    final width = UIUtils().size(context).width;
    final topHeight = height * 0.2;
    final bottomHeight = height - topHeight;

    final user = Provider.of<User>(context);

    return Scaffold(
        appBar: AppBar(
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
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc("${user.email}")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final userdata = UserModel.fromFirestore(snapshot.data);

                  return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: width * 0.03, vertical: height * 0.03),
                      child: Column(children: [
                        Container(
                          height: topHeight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Material(
                                child: InkWell(
                                  onTap: () {},
                                  child: CircleAvatar(
                                      foregroundColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      radius: width * 0.11,
                                      child: CachedNetworkImage(
                                        imageUrl: userdata.image,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              heightGap(),
                              Text(
                                "${userdata.firstName} ${userdata.lastname}",
                                style: getNameStyle(context),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Container(
                          height: bottomHeight,
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                SizedBox(height: height * 0.06),
                                ProfileDetailLine(
                                  icon: Icons.mail,
                                  title: "Email",
                                  detail: "${userdata.email}",
                                ),
                                ProfileDetailLine(
                                  icon: Icons.phone,
                                  title: "Phone",
                                  detail: "${userdata.phoneNumber}",
                                ),
                                ProfileDetailLine(
                                  icon: Icons.flag,
                                  title: "City",
                                  detail: "${userdata.city}",
                                ),
                                ProfileDetailLine(
                                  icon: Icons.flag,
                                  title: "State",
                                  detail: "${userdata.state}",
                                ),
                                ProfileDetailLine(
                                  icon: Icons.flag,
                                  title: "Country",
                                  detail: "${userdata.country}",
                                ),
                                ProfileDetailLine(
                                  icon: Icons.map,
                                  title: "Zip",
                                  detail: "${userdata.zip}",
                                ),
                              ],
                            ),
                          ),
                        ))
                      ]));
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ));
  }
}

class ProfileDetailLine extends StatelessWidget {
  final String title;
  final String detail;
  final IconData icon;

  const ProfileDetailLine(
      {Key key, this.title = "", this.detail = "", this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon),
                widthGap(),
                Text(
                  title,
                  style: getTitleStyle(context),
                )
              ],
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                Text(
                  detail,
                  style: getDetailStyle(context),
                )
              ],
            )
          ],
        ),
        Divider(
          color: Colors.grey,
          height: UIUtils().size(context).height * 0.04,
          thickness: 0.3,
        )
      ],
    );
  }
}

Widget heightGap() {
  return SizedBox(height: 20);
}

Widget widthGap() {
  return SizedBox(width: 10);
}

getTitleStyle(BuildContext context) {
  return TextStyle(
    fontSize: UIUtils().size(context).width * 0.035,
  );
}

getDetailStyle(BuildContext context) {
  return TextStyle(
    fontSize: UIUtils().size(context).width * 0.035,
  );
}

getNameStyle(BuildContext context) {
  return TextStyle(
    fontSize: UIUtils().size(context).width * 0.06,
    fontWeight: FontWeight.bold,
  );
}
