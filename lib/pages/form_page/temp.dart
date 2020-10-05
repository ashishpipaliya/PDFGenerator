import 'package:flutter/material.dart';

class TempW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: container,
    );
  }
}

Container container = Container(
    alignment: Alignment.bottomCenter,
    child: Wrap(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 40, left: 36),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 16, left: 36),
                child: Text(
                  "Strings.email_address",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'HelveticaNeue'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(36, 16, 36, 0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Strings.enter_email",
                    border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(4.0),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        )),
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                        color: Colors.blue.shade200,
                        fontSize: 13,
                        fontFamily: 'HelveticaNeueMedium'),
                    contentPadding:
                        EdgeInsets.only(left: 14, bottom: 8, top: 8),
                  ),
                  style: TextStyle(
                      color: Colors.blue.shade100,
                      fontSize: 13,
                      fontFamily: 'HelveticaNeueBold'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (v) {},
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 16, left: 36),
                child: Text(
                  " Strings.password",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'HelveticaNeue'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(36, 16, 36, 0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Strings.password",
                    border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(4.0),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        )),
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(
                        color: Colors.blue.shade200,
                        fontSize: 13,
                        fontFamily: 'HelveticaNeueMedium'),
                    contentPadding:
                        EdgeInsets.only(left: 14, bottom: 8, top: 8),
                  ),
                  style: TextStyle(
                      color: Colors.blue.shade200,
                      fontSize: 13,
                      fontFamily: 'HelveticaNeueBold'),
                  textInputAction: TextInputAction.done,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(top: 8, right: 36),
                        child: Text(
                          "Strings.forgot_password",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'HelveticaNeueBold',
                              fontSize: 13),
                        ),
                      ))
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.fromLTRB(36, 30, 36, 0),
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  child: Center(
                    child: Text(
                      " Strings.login",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue.shade100,
                        fontFamily: 'HelveticaNeueBold',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(30, 8, 30, 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      " Strings.not_have_account",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'HelveticaNeue',
                          fontSize: 13),
                    ),
                    InkWell(
                      child: Text(
                        "Strings.signup",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'HelveticaNeueBold',
                            fontSize: 13),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
