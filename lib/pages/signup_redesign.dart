import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_gen/pages/login_redesign.dart';
import 'package:pdf_gen/services/validation.dart';
import 'package:pdf_gen/shared/background_animation.dart';
import 'file:///C:/Users/ashis/Documents/Flutter/Agile%20Infoways/pdf_gen/lib/services/auth.dart';
import 'package:pdf_gen/shared/color_palette.dart';
import 'package:pdf_gen/utils/ui_utils.dart';
import 'package:pdf_gen/widgets/button_widget.dart';
import 'package:pdf_gen/widgets/textfield_widget.dart';
import 'package:pdf_gen/wrapper/wrapper.dart';

class SignupRedesign extends StatefulWidget {
  @override
  _SignupRedesignState createState() => _SignupRedesignState();
}

class _SignupRedesignState extends State<SignupRedesign> {
  String _firstName;
  String _lastName;
  String _email;
  String _password;
  String _city;
  String _state;
  String _zip;
  String _county;
  String _phone;
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  String _error;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  AuthProvider _auth = AuthProvider();
  Validator _validator = Validator();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarIconBrightness: Brightness.light));

    final height = UIUtils().size(context).height;
    final width = UIUtils().size(context).width;

    final topHeight = height * 0.35;
    final bottomHeight = height - topHeight;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: ColorPalette.white,
        body: Container(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: topHeight,
                child: Stack(
                  children: [
                    flareBackground,
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
              Expanded(
                child: Container(
                  // width: width * 0.98,
                  height: bottomHeight,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: ColorPalette.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Form(
                      key: _formKey,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: width * 0.4,
                                    child: TextFieldWidget(
                                      hintText: 'First name',
                                      keyboardType: TextInputType.name,
                                      validator: (value) =>
                                          _validator.firstNameValidator(value),
                                      obscureText: false,
                                      onChanged: (value) {
                                        _firstName = value;
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.4,
                                    child: TextFieldWidget(
                                      hintText: 'Last name',
                                      obscureText: false,
                                      keyboardType: TextInputType.name,
                                      validator: (value) =>
                                          _validator.lastNameValidator(value),
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
                                  validator: (value) =>
                                      _validator.emailValidator(value)),
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
                                validator: (value) => value.length < 6
                                    ? 'Password too short'
                                    : null,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: width * 0.4,
                                    child: TextFieldWidget(
                                      hintText: 'City',
                                      keyboardType: TextInputType.text,
                                      validator: (value) =>
                                          _validator.notEmptyValidator(
                                              value, "city name"),
                                      obscureText: false,
                                      onChanged: (value) {
                                        _city = value;
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.4,
                                    child: TextFieldWidget(
                                      hintText: 'State',
                                      obscureText: false,
                                      keyboardType: TextInputType.text,
                                      validator: (value) =>
                                          _validator.notEmptyValidator(
                                              value, "state name"),
                                      onChanged: (value) {
                                        _state = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              heightGap(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: width * 0.4,
                                    child: TextFieldWidget(
                                      hintText: 'Country',
                                      keyboardType: TextInputType.text,
                                      validator: (value) =>
                                          _validator.notEmptyValidator(
                                              value, "country name"),
                                      obscureText: false,
                                      onChanged: (value) {
                                        _county = value;
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.4,
                                    child: TextFieldWidget(
                                      hintText: 'Zip',
                                      obscureText: false,
                                      keyboardType: TextInputType.number,
                                      validator: (value) =>
                                          _validator.zipNameValidator(value),
                                      onChanged: (value) {
                                        _zip = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              heightGap(),
                              Text(_error ?? '',
                                  style: UIUtils().getTextStyle(
                                      color: ColorPalette.errorRed)),
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
                  ),
                ),
              ),
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

      Future.delayed(Duration(milliseconds: 10), () {
        try {
          if (result != null) {
            if (result
                .toString()
                .contains("The account already exists for that email.")) {
              setState(() {
                _error =
                    "The account already exists for this email. Please Login";
              });
            } else {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Wrapper()));
            }
          }
        } catch (e) {
          print(e.toString());
        }
      });
      UIUtils().dismissProgressDialog(context);
    }
  }
}
