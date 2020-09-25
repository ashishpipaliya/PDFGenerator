import 'package:flutter/material.dart';
import 'file:///C:/Users/ashis/Documents/Flutter/Agile%20Infoways/pdf_gen/lib/rip/custom_text_field.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>
    with SingleTickerProviderStateMixin {
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SigninButton(),
                WelcomeText(),

                CustomTextField(label: "Email address"),
                CustomTextField(label: "Password"),
                CustomTextField(label: "Phone"),
                CustomTextField(label: "City"),
                CustomTextField(label: "State"),
                CustomTextField(label: "Zip"),
                bottomGap(),

                CustomButton(
                    lable: "Sign Up",
                    backgroundColor: Colors.blue[50],
                    onPressed: () {}),
                bottomGap(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SigninButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          FlatButton(
            onPressed: () {},
            child: Text("Login"),
            splashColor: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Welcome,",
            style: TextStyle(fontSize: 35),
          ),
          CircleAvatar(
            maxRadius: 30,
            child: FadeInImage.assetNetwork(
                placeholder: "assets/pages.profile.png",
                image:
                    "https://img.freepik.com/free-vector/businessman-pages.profile-cartoon_18591-58479.jpg"),
          )
        ],
      ),
    );
  }
}

Widget bottomGap() {
  return SizedBox(height: 32);
}

class CustomButton extends StatelessWidget {
  final String lable;
  final Function onPressed;
  final Color backgroundColor;

  const CustomButton(
      {Key key, this.lable, this.onPressed, this.backgroundColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: FlatButton(
            color: backgroundColor, onPressed: onPressed, child: Text(lable)));
  }
}

class ContinueWith extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("OR"),
          Container(
            height: 1.0,
            width: 130.0,
            color: Colors.grey,
          ),
          Text("Continue with"),
        ],
      ),
    );
  }
}

class SocialLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          maxRadius: 20,
          backgroundColor: Colors.transparent,
          child: FadeInImage.assetNetwork(
              placeholder: "assets/pages.profile.png",
              image:
                  "https://facebookbrand.com/wp-content/uploads/2019/04/f_logo_RGB-Hex-Blue_512.png?w=512&h=512"),
        ),
        CircleAvatar(
            maxRadius: 20,
            backgroundColor: Colors.transparent,
            child: FadeInImage.assetNetwork(
                placeholder: "assets/pages.profile.png",
                image:
                    "https://lh3.googleusercontent.com/proxy/wb3iM1vAovMPz_VesxrmfOpxQO7Nmd3pXqnI1ZZAvpj2BWOLXlhYgdtZV_cpB_jStc8TPoUcEUyaiZs3QtPDOwOqlW7DXFRQ47MsmKzZ5Wma6c4bgKo")),
        CircleAvatar(
            maxRadius: 20,
            backgroundColor: Colors.transparent,
            child: FadeInImage.assetNetwork(
                placeholder: "assets/pages.profile.png",
                image: "https://pngimg.com/uploads/twitter/twitter_PNG9.png")),
      ],
    );
  }
}
