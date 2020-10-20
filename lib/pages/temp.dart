import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/pages/pdf/pdf_viewer.dart';
import 'package:pdf_gen/services/load_pdf.dart';
import 'package:provider/provider.dart';

class TempLanding extends StatefulWidget {
  @override
  _TempLandingState createState() => _TempLandingState();
}

class _TempLandingState extends State<TempLanding> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(user.email)
                  .collection("pdf")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.docs.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        final currentFile = snapshot.data.docs[index].data();
                        final fileName = currentFile["name"];
                        final pdfUrl = currentFile["url"];

                        return Container(
                          height: 100,
                          child: Card(
                            child: InkWell(
                              onTap: () async {
                                await FetchAndStorePdf()
                                    .getFileFromUrl(context, pdfUrl, fileName);
                              },
                              child: Center(
                                child: ListTile(
                                  title: Text(fileName),
                                  subtitle: Text(
                                      "created : ${fileName.split("T")[0]}"),
                                  dense: false,
                                  leading: Image.asset("assets/pdflogo.png"),
                                  // trailing: IconButton(
                                  //   icon: Icon(Icons.more_vert),
                                  //   // onPressed: () {
                                  //   //   _menuBottomSheet(context, currentFile);
                                  //   // },
                                  // ),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
