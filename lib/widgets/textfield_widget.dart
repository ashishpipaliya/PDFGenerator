import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_gen/shared/color_palette.dart';
import 'package:pdf_gen/utils/ui_utils.dart';

class TextFieldWidgetwithIcon extends StatelessWidget {
  final TextEditingController controller;
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
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = UIUtils().size(context).height;
    return Container(
      // height: height * 0.08 < 50 ? height * 0.08 : 50,
      child: TextFormField(
        controller: controller,
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
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: UIUtils().getTextStyle(
                fontsize: 13, isChangeAccordingToDeviceSize: true),
            counterStyle: const TextStyle(fontSize: 0),
            counter: SizedBox.shrink(),
            errorText: errorText,
            prefixIcon: Icon(
              prefixIconData,
              size: 15,
              color: ColorPalette.darkPurple,
            ),
            filled: true,
            errorStyle: UIUtils().getTextStyle(
                fontsize: 10, isChangeAccordingToDeviceSize: false),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorPalette.darkPurple),
            ),
            errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorPalette.errorRed),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorPalette.errorRed),
            ),
            suffixIcon: GestureDetector(
              onTap: togglePassword,
              child: Icon(
                suffixIconData,
                size: 15,
                color: ColorPalette.darkPurple,
              ),
            ),
            labelStyle: TextStyle(color: ColorPalette.darkPurple),
            focusColor: ColorPalette.darkPurple),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
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
      this.maxLength,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = UIUtils().size(context).height;
    return Container(
      // height: height * 0.08 < 50 ? height * 0.08 : 50,
      child: TextFormField(
        controller: controller,
        style: UIUtils().getTextStyle(fontsize: 14),
        maxLength: maxLength,
        validator: validator,
        obscureText: obscureText,
        onChanged: onChanged,
        keyboardType: keyboardType,
        cursorColor: ColorPalette.darkPurple,
        textAlignVertical: TextAlignVertical.center,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: UIUtils().getTextStyle(
                fontsize: 13, isChangeAccordingToDeviceSize: true),
            counterStyle: const TextStyle(fontSize: 0),
            counter: SizedBox.shrink(),
            filled: true,
            errorStyle: UIUtils().getTextStyle(fontsize: 10),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorPalette.darkPurple),
            ),
            errorBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ColorPalette.errorRed)),
            focusedErrorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorPalette.errorRed),
            ),
            labelStyle: TextStyle(color: ColorPalette.darkPurple),
            focusColor: ColorPalette.darkPurple),
      ),
    );
  }
}

class SimpleFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final Function onChanged;
  final String Function(String) validator;
  final int maxLength;

  const SimpleFormField(
      {Key key,
      this.controller,
      this.keyboardType,
      this.onChanged,
      this.validator,
      this.maxLength,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Center(
        child: TextFormField(
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          keyboardType: keyboardType,
          cursorColor: ColorPalette.darkPurple,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              helperStyle: TextStyle(height: 0),
              errorStyle: TextStyle(height: 0),
              hintText: hintText,
              hintStyle: UIUtils().getTextStyle(
                  fontsize: 13, isChangeAccordingToDeviceSize: true),
              counterStyle: const TextStyle(fontSize: 0),
              counter: SizedBox.shrink(),
              isDense: false,
              filled: true,
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: ColorPalette.darkPurple, width: 0.5),
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ColorPalette.darkPurple),
              ),
              errorBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorPalette.errorRed)),
              focusedErrorBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ColorPalette.errorRed),
              ),
              labelStyle: TextStyle(color: ColorPalette.darkPurple),
              focusColor: ColorPalette.darkPurple),
        ),
      ),
    );
  }
}
