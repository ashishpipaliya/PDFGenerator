import 'package:flutter/material.dart';
import 'package:pdf_gen/shared/color_palette.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onChanged;
  final Function togglePassword;
  final String Function(String) validator;

  const TextFieldWidget(
      {Key key,
      this.hintText,
      this.prefixIconData,
      this.suffixIconData,
      this.obscureText,
      this.onChanged,
      this.keyboardType,
      this.togglePassword,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: ColorPalette.darkPurple,
        fontSize: 14.0,
      ),
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: keyboardType,
      cursorColor: ColorPalette.darkPurple,
      decoration: InputDecoration(
          labelText: hintText,
          prefixIcon: Icon(
            prefixIconData,
            size: 18,
            color: ColorPalette.darkPurple,
          ),
          filled: true,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorPalette.darkPurple),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorPalette.errorRed)),
          suffixIcon: GestureDetector(
            onTap: togglePassword,
            child: Icon(
              suffixIconData,
              size: 18,
              color: ColorPalette.darkPurple,
            ),
          ),
          labelStyle: TextStyle(color: ColorPalette.darkPurple),
          focusColor: ColorPalette.darkPurple),
    );
  }
}
