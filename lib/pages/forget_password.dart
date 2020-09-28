import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/ashis/Documents/Flutter/Agile%20Infoways/pdf_gen/lib/pages/login.dart';
import 'package:pdf_gen/shared/color_palette.dart';
import 'package:pdf_gen/widgets/button_widget.dart';
import 'package:pdf_gen/widgets/textfield_widget.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
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
                padding: const EdgeInsets.all(30.0),
                child: Form(
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
                          print(_email);
                        },
                      ),
                      SizedBox(height: 50),
                      ButtonWidget(
                        title: 'Submit',
                        hasBorder: false,
                        onPressed: () => print("Submit"),
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
                    "Reset Password",
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
    );
  }
}
