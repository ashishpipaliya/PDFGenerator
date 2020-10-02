import 'package:flutter/material.dart';

class ImageSelectHome extends StatefulWidget {
  @override
  _ImageSelectHomeState createState() => _ImageSelectHomeState();
}

class _ImageSelectHomeState extends State<ImageSelectHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select profile picture"),
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
