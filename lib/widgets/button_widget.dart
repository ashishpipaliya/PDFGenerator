import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/shared/color_palette.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool hasBorder;
  final Function onPressed;

  const ButtonWidget({Key key, this.title, this.hasBorder, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: hasBorder ? ColorPalette.white : ColorPalette.darkPurple,
            borderRadius: BorderRadius.circular(10),
            border: hasBorder
                ? Border.all(color: ColorPalette.darkPurple, width: 1.0)
                : Border.fromBorderSide(BorderSide.none),
          ),
          height: 50.0,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: hasBorder ? ColorPalette.darkPurple : ColorPalette.white,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
