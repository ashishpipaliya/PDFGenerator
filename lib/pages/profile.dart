import 'package:flutter/material.dart';
import 'file:///C:/Users/ashis/Documents/Flutter/Agile%20Infoways/pdf_gen/lib/pages/login.dart';
import 'package:pdf_gen/shared/color_palette.dart';
import 'package:pdf_gen/widgets/button_widget.dart';
import 'package:pdf_gen/widgets/textfield_widget.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
        actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Text(
              "Profile",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
            ),
            heightGap(),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorPalette.darkPurple,
                          border: Border.all(
                            width: 4.0,
                            color: ColorPalette.white,
                          )),
                      child: InkWell(
                        onTap: () {
                          print("Edit profile");
                        },
                        child: Icon(
                          Icons.edit,
                          color: ColorPalette.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5 - 30,
                  child: TextFieldWidget(
                    hintText: 'First name',
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                ),
                widthGap(),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5 - 30,
                  child: TextFieldWidget(
                    hintText: 'Last name',
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                ),
              ],
            ),
            heightGap(),
            TextFieldWidget(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                prefixIconData: Icons.mail_outline,
                onChanged: (value) {
                  print(value);
                },
                validator: (value) {
                  Pattern pattern = r"[^@\t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+";
                  bool validEmail = RegExp(pattern).hasMatch(value);
                  return !validEmail ? 'Invalid email' : null;
                }),
            heightGap(),
            TextFieldWidget(
              hintText: 'Phone',
              keyboardType: TextInputType.number,
              obscureText: false,
              prefixIconData: Icons.phone_android,
              onChanged: (value) {
                print(value);
              },
              validator: (value) =>
                  value.length < 10 ? 'Incorrect number' : null,
            ),
            heightGap(),
            ButtonWidget(title: 'Cancel', hasBorder: false, onPressed: () {}),
            heightGap(),
            ButtonWidget(title: 'Save', hasBorder: true, onPressed: () {}),
            heightGap(),
          ],
        ),
      ),
    );
  }
}
