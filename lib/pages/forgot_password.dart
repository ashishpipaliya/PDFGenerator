import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_gen/pages/login_redesign.dart';
import 'package:pdf_gen/services/auth.dart';
import 'package:pdf_gen/services/validation.dart';
import 'package:pdf_gen/shared/background_animation.dart';
import 'package:pdf_gen/shared/color_palette.dart';
import 'package:pdf_gen/utils/ui_utils.dart';
import 'package:pdf_gen/widgets/button_widget.dart';
import 'package:pdf_gen/widgets/textfield_widget.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  AuthProvider _auth = AuthProvider();
  String _email;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
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
                            "Forgot Password",
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
                                controller: _emailController,
                                hintText: 'Email',
                                validator: (value) =>
                                    _validator.emailValidator(value),
                                keyboardType: TextInputType.emailAddress,
                                obscureText: false,
                                prefixIconData: Icons.mail_outline,
                                onChanged: (value) {
                                  _email = value;
                                },
                              ),
                              SizedBox(height: 50),
                              ButtonWidget(
                                title: 'Submit',
                                hasBorder: false,
                                onPressed: () {
                                  _onSubmit(_email);
                                },
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

  void _onSubmit(String email) async {
    var result;
    if (_formKey.currentState.validate()) {
      FocusScope.of(context).unfocus();
      UIUtils().showProgressDialog(context);

      await _auth.resetPassword(email).then((value) {
        print("result : $value");
        result = value;
        _emailController.clear();
        UIUtils().dismissProgressDialog(context);

        try {
          if (result.toString().contains(
              "There is no user record corresponding to this identifier")) {
            UIUtils().myDialog(
                context,
                "Error",
                "No user found for this email. Please check your email address and try again.",
                "Ok");
          } else if (result
              .toString()
              .contains("The email address is badly formatted")) {
            UIUtils().myDialog(
              context,
              "Error",
              "The email address is badly formatted. Enter valid email",
              "ok",
            );
          } else {
            UIUtils().myDialog(
                context,
                "Successful",
                "Password reset email sent successfully. Please check your inbox to reset password",
                "ok");
          }
        } catch (e) {
          UIUtils().myDialog(
              context, "Error Occurred", "Please try after sometime", "Ok");
        }
      });
    }
  }
}
