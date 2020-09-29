import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_gen/shared/color_palette.dart';
import 'package:pdf_gen/utils/ui_utils.dart';

class TextFieldWidgetwithIcon extends StatelessWidget {
  final String hintText;
  final String errorText;
  final TextInputType keyboardType;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onChanged;
  final Function togglePassword;
  final String Function(String) validator;
  final int maxLength;

  const TextFieldWidgetwithIcon({
    Key key,
    @required this.hintText,
    this.prefixIconData,
    this.suffixIconData,
    this.obscureText,
    @required this.onChanged,
    this.keyboardType,
    this.togglePassword,
    this.validator,
    this.errorText,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: UIUtils().getTextStyle(fontsize: 14),
      // TextStyle(
      //   color: ColorPalette.darkPurple,
      //   fontSize: 14.0,
      // ),
      maxLength: maxLength,
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: keyboardType,
      cursorColor: ColorPalette.darkPurple,
      decoration: InputDecoration(
          labelText: hintText,
          errorText: errorText,
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
            borderSide: BorderSide(color: ColorPalette.errorRed),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorPalette.errorRed),
          ),
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

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function onChanged;
  final String Function(String) validator;
  final int maxLength;

  const TextFieldWidget(
      {Key key,
      @required this.hintText,
      this.obscureText,
      @required this.onChanged,
      this.keyboardType,
      this.validator,
      this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: UIUtils().getTextStyle(fontsize: 14),
      maxLength: maxLength,
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: keyboardType,
      cursorColor: ColorPalette.darkPurple,
      decoration: InputDecoration(
          hintText: hintText,
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
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorPalette.errorRed),
          ),
          labelStyle: TextStyle(color: ColorPalette.darkPurple),
          focusColor: ColorPalette.darkPurple),
    );
  }
}
