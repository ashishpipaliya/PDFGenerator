import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pdf_gen/shared/color_palette.dart';
import 'package:pdf_gen/utils/logger.dart';

class UIUtils {
  factory UIUtils() {
    return _singleton;
  }
  static final UIUtils _singleton = UIUtils._internal();

  UIUtils._internal() {
    Logger().v("Instance created UIUtills");
  }

  //region Screen Size and Proportional according to device
  double _screenHeight;
  double _screenWidth;

  double get screenHeight => _screenHeight ?? _referenceScreenHeight;

  double get screenWidth => _screenWidth ?? _referenceScreenWidth;

  final double _referenceScreenHeight = 812;
  final double _referenceScreenWidth = 375;

  Size size(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  void updateScreenDimension({double width, double height}) {
    if (_screenWidth != null && _screenHeight != null) {
      return;
    }
    Logger().v("Update Screen Dimension");

    _screenWidth = (width != null) ? width : _screenWidth;
    _screenHeight = (height != null) ? height : _screenHeight;
  }

  double get getNavBarSize => min(UIUtils().getProportionalHeight(52.0), 52.0);

  double getProportionalHeight(double height) {
    if (_screenHeight == null) return height;
    final h = _screenHeight * height / _referenceScreenHeight;
    return h.floorToDouble();
  }

  double getProportionalWidth(double width) {
    if (_screenWidth == null) return width;
    final w = _screenWidth * width / _referenceScreenWidth;
    return w.floorToDouble();
  }

  TextStyle getTextStyle(
      {String fontName = 'Nunito-Light',
      int fontsize = 12,
      Color color,
      bool isChangeAccordingToDeviceSize = true,
      double characterSpacing,
      double wordSpacing,
      double lineSpacing}) {
    double finalFontSize = fontsize.toDouble();

    if (isChangeAccordingToDeviceSize && this._screenWidth != null) {
      finalFontSize = (finalFontSize * _screenWidth) / _referenceScreenWidth;
    }

    return TextStyle(
        fontSize: finalFontSize,
        fontFamily: fontName,
        color: color,
        letterSpacing: characterSpacing,
        wordSpacing: wordSpacing,
        height: lineSpacing);
  }

  static Widget buildLoadMoreProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(15.0),
      child: new Center(
        child: new Opacity(
          opacity: 1.0,
          child: SizedBox(
            child: new CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(ColorPalette.darkPurple),
              strokeWidth: 2.0,
            ),
            width: 20.0,
            height: 20.0,
          ),
        ),
      ),
    );
  }

  Future<void> showProgressDialog(BuildContext context) {
    Logger().v("DisPlay Loader");
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => ProgressDialog());
  }

  Future<void> dismissProgressDialog(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  myDialog(
    BuildContext context,
    String title,
    String content,
    String buttonText,
  ) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    buttonText,
                    style: TextStyle(color: ColorPalette.darkPurple),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}

class ProgressDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: SpinKitDoubleBounce(color: ColorPalette.darkPurple),
        onWillPop: this._onBackSpace);
  }

  Future<bool> _onBackSpace() async {
    return false;
  }
}
