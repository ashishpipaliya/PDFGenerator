import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_gen/pages/forget_password.dart';
import 'package:pdf_gen/pages/signup_redesign.dart';
import 'package:pdf_gen/services/auth.dart';
import 'package:pdf_gen/services/validation.dart';
import 'package:pdf_gen/shared/background_animation.dart';
import 'package:pdf_gen/shared/color_palette.dart';
import 'package:pdf_gen/utils/ui_utils.dart';
import 'package:pdf_gen/widgets/button_widget.dart';
import 'package:pdf_gen/widgets/textfield_widget.dart';

class LoginRedesign extends StatefulWidget {
  @override
  _LoginRedesignState createState() => _LoginRedesignState();
}

class _LoginRedesignState extends State<LoginRedesign> {
  String _email;
  String _password;
  String _error;
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

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
                            "Login",
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
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  height: bottomHeight,
                  decoration: BoxDecoration(
                      color: ColorPalette.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Form(
                      key: _formKey,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextFieldWidgetwithIcon(
                                hintText: 'Email',
                                keyboardType: TextInputType.emailAddress,
                                obscureText: false,
                                prefixIconData: Icons.mail_outline,
                                onChanged: (value) {
                                  _email = value;
                                },
                                validator: (value) =>
                                    _validator.emailValidator(value),
                              ),
                              heightGap(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
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
                                        _validator.passwordValidator(value),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgetPassword()));
                                    },
                                    child: Text(
                                      'Forgot password',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: ColorPalette.darkPurple),
                                    ),
                                  )
                                ],
                              ),
                              heightGap(),
                              Text(_error ?? '',
                                  style: UIUtils().getTextStyle(
                                      color: ColorPalette.errorRed)),
                              heightGap(),
                              ButtonWidget(
                                title: 'Login',
                                hasBorder: false,
                                onPressed: _onClickLogin,
                                // onPressed: () async {
                                //   // await _auth.login(_email, _password);
                                // },
                              ),
                              heightGap(),
                              ButtonWidget(
                                title: 'Sign Up',
                                hasBorder: true,
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

  void _onClickLogin() async {
    if (_formKey.currentState.validate()) {
      FocusScope.of(context).unfocus();
      UIUtils().showProgressDialog(context);
      final result = await _auth.login(_email, _password);
      if (result == null) {
        setState(() {
          _error = 'Please check your credentials and try again';
        });
      } else {
        _error = "";
      }

      UIUtils().dismissProgressDialog(context);
    }
  }

  void _onClickSignup() {
    FocusScope.of(context).unfocus();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignupRedesign(),
        ));
  }
}

Widget heightGap() {
  return SizedBox(height: 15);
}

Widget widthGap() {
  return SizedBox(width: 15);
}
