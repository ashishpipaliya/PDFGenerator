import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/services/auth/auth.dart';
import 'file:///C:/Users/ashis/Documents/Flutter/Agile%20Infoways/pdf_gen/lib/pages/login.dart';
import 'package:pdf_gen/shared/color_palette.dart';
import 'package:pdf_gen/utils/ui_utils.dart';
import 'package:pdf_gen/widgets/button_widget.dart';
import 'package:pdf_gen/widgets/textfield_widget.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  AuthProvider _auth = AuthProvider();
  String _email;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = UIUtils().size(context).width;
    final height = UIUtils().size(context).height;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              height: height * 0.6,
              // width: MediaQuery.of(context).size.width,
              child: FlareActor(
                'assets/flare/flow.flr',
                animation: "Flow",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextFieldWidgetwithIcon(
                        hintText: 'Email',
                        validator: (value) {
                          Pattern pattern =
                              r"[^@\t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+";
                          bool validEmail = RegExp(pattern).hasMatch(value);

                          return !validEmail ? 'Invalid email' : null;
                        },
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
                          _onClickLogin(_email);
                        },
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
                    "Reset Password",
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
    );
  }

  void _onClickLogin(String email) async {
    if (_formKey.currentState.validate()) {
      FocusScope.of(context).unfocus();
      UIUtils().showProgressDialog(context);

      final result = await _auth.resetPassword(email);
      print("mail :" + email);
      UIUtils().dismissProgressDialog(context);
      _emailController.clear();
      try {
        if (result ==
            "There is no user record corresponding to this identifier. The user may have been deleted.") {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text("Error"),
                    content: Text(
                        "No user found for this email. Please check your email address and try again."),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ));
        } else {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text("Successful"),
                    content: Text(
                        "Password reset email sent successsfully. Please check your inbox to reset password"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ));
          print("mail sent");
        }
      } catch (e) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Error Occurred"),
                  content: Text("Please try after sometime"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ));
      }
    }
  }
}
