import 'package:flutter/material.dart';
import 'package:pdf_gen/shared/color_palette.dart';

class FormFieldWidget extends StatelessWidget {
  final String labelText;

  const FormFieldWidget({
    Key key,
    this.labelText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            labelText: labelText,
            helperText: ' ',
            labelStyle:
                TextStyle(fontSize: 15.0, color: ColorPalette.darkPurple),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  BorderSide(color: ColorPalette.darkPurple, width: 0.5),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  BorderSide(color: ColorPalette.darkPurple, width: 1.5),
            ),
            errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: ColorPalette.errorRed),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: ColorPalette.errorRed),
            ),
            focusColor: ColorPalette.darkPurple),
      ),
    );
  }
}

Widget titleText(String heading) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        heading,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
      ),
      Divider(
        color: Colors.grey,
        thickness: 3.0,
      )
    ],
  );
}

Widget normalTitleText(String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      SizedBox(height: 10),
      Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black54),
      )
    ],
  );
}

Widget smallTitleText(String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      SizedBox(height: 10),
      Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black54),
      )
    ],
  );
}
