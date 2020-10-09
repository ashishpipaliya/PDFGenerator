import 'package:flutter/material.dart';
import 'package:pdf_gen/shared/color_palette.dart';

class FormFieldWidget extends StatelessWidget {
  final String labelText;
  final int maxLines;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final void Function(String) onSubmitted;
  final FocusNode focusNode;

  const FormFieldWidget({
    Key key,
    this.labelText,
    this.maxLines = 1,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        textAlignVertical: TextAlignVertical.center,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        focusNode: focusNode,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            labelText: labelText,
            helperText: ' ',
            filled: true,
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

class CheckBoxTile extends StatelessWidget {
  final double width;
  final bool value;
  final Widget title;
  final void Function(bool) onChanged;

  const CheckBoxTile(
      {Key key, this.width, this.value, this.title, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: width,
        child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return CheckboxListTile(
            value: value,
            title: title,
            checkColor: ColorPalette.darkPurple,
            activeColor: ColorPalette.white,
            onChanged: onChanged,
          );
        }),
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
      SizedBox(height: 20),
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
      SizedBox(height: 50),
      Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black54),
      )
    ],
  );
}

Widget paragraphText(String paragraph) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        paragraph,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black45),
      )
    ],
  );
}
