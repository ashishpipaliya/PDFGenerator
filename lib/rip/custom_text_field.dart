import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;

  const CustomTextField({Key key, this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: label,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          )),
    );
  }
}
