import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_gen/services/auth/auth.dart';
import 'file:///C:/Users/ashis/Documents/Flutter/Agile%20Infoways/pdf_gen/lib/pages/login.dart';
import 'package:pdf_gen/shared/color_palette.dart';
import 'package:pdf_gen/utils/ui_utils.dart';
import 'package:pdf_gen/widgets/button_widget.dart';
import 'package:pdf_gen/widgets/textfield_widget.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String _email;
  String _password;
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                // width: MediaQuery.of(context).size.width,
                child: FlareActor(
                  'assets/flare/flow.flr',
                  animation: "Flow",
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.5 - 30,
                              child: TextFieldWidget(
                                hintText: 'First name',
                                keyboardType: TextInputType.name,
                                obscureText: false,
                                onChanged: (value) {},
                              ),
                            ),
                            widthGap(),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.5 - 30,
                              child: TextFieldWidget(
                                hintText: 'Last name',
                                obscureText: false,
                                keyboardType: TextInputType.name,
                                onChanged: (value) {},
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
                          obscureText: false,
                          prefixIconData: Icons.phone_android,
                          onChanged: (value) {},
                          validator: (value) =>
                              value.length < 10 ? 'Incorrect number' : null,
                        ),
                        heightGap(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.5 - 30,
                              child: TextFieldWidget(
                                hintText: 'City',
                                keyboardType: TextInputType.text,
                                obscureText: false,
                                onChanged: (value) {},
                              ),
                            ),
                            widthGap(),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.5 - 30,
                              child: TextFieldWidget(
                                hintText: 'State',
                                obscureText: false,
                                keyboardType: TextInputType.text,
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                        heightGap(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.5 - 30,
                              child: TextFieldWidget(
                                hintText: 'Country',
                                keyboardType: TextInputType.text,
                                obscureText: false,
                                onChanged: (value) {},
                              ),
                            ),
                            widthGap(),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.5 - 30,
                              child: TextFieldWidget(
                                hintText: 'Zip',
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {},
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
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: ColorPalette.cream,
                          fontSize: 35,
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
    FocusScope.of(context).requestFocus(FocusNode());
    UIUtils().showProgressDialog(context);

    await _auth.signup(_email, _password);

    Future.delayed(Duration(milliseconds: 1500), () {});
    UIUtils().dismissProgressDialog(context);
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => Wrapper()));
  }
}
