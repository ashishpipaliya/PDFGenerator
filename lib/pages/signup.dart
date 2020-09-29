import 'dart:io';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf_gen/services/auth/auth.dart';
import 'package:pdf_gen/services/database.dart';
import 'file:///C:/Users/ashis/Documents/Flutter/Agile%20Infoways/pdf_gen/lib/pages/login.dart';
import 'package:pdf_gen/shared/color_palette.dart';
import 'package:pdf_gen/utils/logger.dart';
import 'package:pdf_gen/utils/ui_utils.dart';
import 'package:pdf_gen/widgets/button_widget.dart';
import 'package:pdf_gen/widgets/textfield_widget.dart';
import 'package:pdf_gen/wrapper/wrapper.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String _firstName;
  String _lastName;
  String _email;
  String _password;
  String _image;
  String _city;
  String _state;
  String _zip;
  String _county;
  String _phone;
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  AuthProvider _auth = AuthProvider();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarIconBrightness: Brightness.light));

    final height = UIUtils().size(context).height;
    final width = UIUtils().size(context).width;

    File _imageFile;
    ;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Stack(
            children: [
              Container(
                height: height * 0.35,
                child: Opacity(
                  opacity: 1,
                  child: FlareActor(
                    'assets/flare/flow.flr',
                    animation: "Flow",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: width,
                height: height,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: width * 0.5 - 30,
                              child: TextFieldWidget(
                                hintText: 'First name',
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  return (value.isEmpty)
                                      ? 'Enter valid first name'
                                      : null;
                                },
                                obscureText: false,
                                onChanged: (value) {
                                  _firstName = value;
                                },
                              ),
                            ),
                            widthGap(),
                            Container(
                              width: width * 0.5 - 30,
                              child: TextFieldWidget(
                                hintText: 'Last name',
                                obscureText: false,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  return (value.length < 2 ||
                                          value.isEmpty ||
                                          value.contains(RegExp(r'[0-9]')))
                                      ? 'Enter valid last name'
                                      : null;
                                },
                                onChanged: (value) {
                                  _lastName = value;
                                },
                              ),
                            ),
                          ],
                        ),
                        heightGap(),
                        TextFieldWidgetwithIcon(
                            hintText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            prefixIconData: Icons.mail_outline,
                            onChanged: (value) {
                              _email = value;
                            },
                            validator: (value) {
                              Pattern pattern =
                                  r"[^@\t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+";
                              bool validEmail = RegExp(pattern).hasMatch(value);
                              return !validEmail ? 'Invalid email' : null;
                            }),
                        heightGap(),
                        TextFieldWidgetwithIcon(
                          hintText: 'Password',
                          obscureText: _obscureText,
                          prefixIconData: Icons.lock_outline,
                          suffixIconData: _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          togglePassword: () => _toggle(),
                          onChanged: (value) {
                            _password = value;
                          },
                          validator: (value) =>
                              value.length < 6 ? 'Password too short' : null,
                        ),
                        heightGap(),
                        TextFieldWidgetwithIcon(
                            hintText: 'Phone',
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            obscureText: false,
                            prefixIconData: Icons.phone_android,
                            onChanged: (value) {
                              _phone = value;
                            },
                            validator: (value) {
                              return value.length != 10
                                  ? 'Invalid number'
                                  : null;
                            }),
                        heightGap(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: width * 0.5 - 30,
                              child: TextFieldWidget(
                                hintText: 'City',
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  return (value.isEmpty)
                                      ? 'Enter city name'
                                      : null;
                                },
                                obscureText: false,
                                onChanged: (value) {
                                  _city = value;
                                },
                              ),
                            ),
                            widthGap(),
                            Container(
                              width: width * 0.5 - 30,
                              child: TextFieldWidget(
                                hintText: 'State',
                                obscureText: false,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  return (value.isEmpty)
                                      ? 'Enter state name'
                                      : null;
                                },
                                onChanged: (value) {
                                  _state = value;
                                },
                              ),
                            ),
                          ],
                        ),
                        heightGap(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: width * 0.5 - 30,
                              child: TextFieldWidget(
                                hintText: 'Country',
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  return (value.isEmpty)
                                      ? 'Enter country name'
                                      : null;
                                },
                                obscureText: false,
                                onChanged: (value) {
                                  _county = value;
                                },
                              ),
                            ),
                            widthGap(),
                            Container(
                              width: width * 0.5 - 30,
                              child: TextFieldWidget(
                                hintText: 'Zip',
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  return value.isEmpty
                                      ? 'Enter valid zip'
                                      : null;
                                },
                                onChanged: (value) {
                                  _zip = value;
                                },
                              ),
                            ),
                          ],
                        ),
                        heightGap(),
                        ButtonWidget(
                          title: 'Sign Up',
                          hasBorder: false,
                          onPressed: _onClickSignup,
                        ),
                        heightGap(),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                height: height * 0.4,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: ColorPalette.superlightPurple,
                          fontSize: width * 0.1,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onClickSignup() async {
    if (_formKey.currentState.validate()) {
      FocusScope.of(context).requestFocus(FocusNode());
      UIUtils().showProgressDialog(context);
      final result = await _auth.signup(
        _firstName,
        _lastName,
        _email,
        _password,
        _city,
        _state,
        _zip,
        _county,
        _phone,
      );
      Future.delayed(Duration(milliseconds: 0), () {
        if (result != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Wrapper()));
        }
      });
      UIUtils().dismissProgressDialog(context);
    }
  }

  isFieldValid(String regexPattern) {
    return RegExp('r"$regexPattern"', caseSensitive: false);
  }
}
