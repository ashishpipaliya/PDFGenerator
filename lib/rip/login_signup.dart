// import 'package:flare_flutter/flare_actor.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pdf_gen/pages/forget_password.dart';
// import 'package:pdf_gen/pages/signup.dart';
// import 'package:pdf_gen/services/auth/auth.dart';
// import 'package:pdf_gen/shared/color_palette.dart';
// import 'package:pdf_gen/utils/ui_utils.dart';
// import 'package:pdf_gen/widgets/button_widget.dart';
// import 'package:pdf_gen/widgets/textfield_widget.dart';
//
// class LoginSignup extends StatefulWidget {
//   @override
//   _LoginSignupState createState() => _LoginSignupState();
// }
//
// class _LoginSignupState extends State<LoginSignup> {
//   String _email;
//   String _password;
//   String _error;
//
//   final _formKeyLogin = GlobalKey<FormState>();
//   final _formKeySignup = GlobalKey<FormState>();
//
//   bool _obscureText = true;
//
//   void _toggle() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }
//
//   // bool isSigninOpened = true;
//   bool absorbing = false;
//   double opacity = 1;
//
//   AuthProvider _auth = AuthProvider();
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
//         .copyWith(statusBarIconBrightness: Brightness.light));
//
//     final height = UIUtils().size(context).height;
//     final width = UIUtils().size(context).width;
//
//     return Stack(
//       children: [
//         // Login Part
//         GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: AbsorbPointer(
//             absorbing: absorbing,
//             child: Scaffold(
//               body: Opacity(
//                 opacity: opacity,
//                 child: SingleChildScrollView(
//                   physics: BouncingScrollPhysics(),
//                   child: Stack(
//                     children: [
//                       Container(
//                         height: height * 0.5,
//                         child: FlareActor(
//                           'assets/flare/flow.flr',
//                           animation: "Flow",
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: MediaQuery.of(context).size.height,
//                         child: Padding(
//                           padding: const EdgeInsets.all(30.0),
//                           child: Form(
//                             key: _formKeyLogin,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 TextFieldWidgetwithIcon(
//                                     hintText: 'Email',
//                                     keyboardType: TextInputType.emailAddress,
//                                     obscureText: false,
//                                     prefixIconData: Icons.mail_outline,
//                                     onChanged: (value) {
//                                       _email = value;
//                                     },
//                                     validator: (value) {
//                                       Pattern pattern =
//                                           r"[^@\t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+";
//                                       bool validEmail =
//                                           RegExp(pattern).hasMatch(value);
//
//                                       return !validEmail
//                                           ? 'Invalid email'
//                                           : null;
//                                     }),
//                                 heightGap(),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     TextFieldWidgetwithIcon(
//                                       hintText: 'Password',
//                                       obscureText: _obscureText,
//                                       prefixIconData: Icons.lock_outline,
//                                       suffixIconData: _obscureText
//                                           ? Icons.visibility
//                                           : Icons.visibility_off,
//                                       togglePassword: () => _toggle(),
//                                       onChanged: (value) {
//                                         _password = value;
//                                       },
//                                       validator: (value) => value.length < 6
//                                           ? 'Password too short'
//                                           : null,
//                                     ),
//                                     FlatButton(
//                                       onPressed: () {
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     ForgetPassword()));
//                                       },
//                                       child: Text(
//                                         'Forgot password',
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.w300,
//                                             color: ColorPalette.darkPurple),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 heightGap(),
//                                 Text(_error ?? '',
//                                     style: UIUtils().getTextStyle(
//                                         color: ColorPalette.errorRed)),
//                                 heightGap(),
//                                 ButtonWidget(
//                                   title: 'Login',
//                                   hasBorder: false,
//                                   onPressed: _onClickLogin,
//                                   // onPressed: () async {
//                                   //   // await _auth.login(_email, _password);
//                                   // },
//                                 ),
//                                 heightGap(),
//                                 ButtonWidget(
//                                   title: 'Sign Up',
//                                   hasBorder: true,
//                                   onPressed: () {
//                                     setState(() {
//                                       absorbing = !absorbing;
//                                       opacity = opacity == 1 ? 0 : 1;
//                                     });
//                                   },
//                                 ),
//                                 heightGap(),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         height: MediaQuery.of(context).size.height * 0.4,
//                         width: MediaQuery.of(context).size.width,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Login",
//                               style: TextStyle(
//                                   color: ColorPalette.cream,
//                                   fontSize: 35,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//
//         //  SignUp Part
//         GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: Scaffold(
//             body: AbsorbPointer(
//               absorbing: absorbing,
//               child: Opacity(
//                 opacity: opacity,
//                 child: SingleChildScrollView(
//                   physics: BouncingScrollPhysics(),
//                   child: Stack(
//                     children: [
//                       Container(
//                         height: height * 0.5,
//                         child: FlareActor(
//                           'assets/flare/flow.flr',
//                           animation: "Flow",
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: MediaQuery.of(context).size.height,
//                         child: Padding(
//                           padding: EdgeInsets.all(15),
//                           child: Form(
//                             key: _formKeySignup,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Container(
//                                       width: MediaQuery.of(context).size.width *
//                                               0.5 -
//                                           30,
//                                       child: TextFieldWidget(
//                                         hintText: 'First name',
//                                         keyboardType: TextInputType.name,
//                                         obscureText: false,
//                                         onChanged: (value) {},
//                                       ),
//                                     ),
//                                     widthGap(),
//                                     Container(
//                                       width: MediaQuery.of(context).size.width *
//                                               0.5 -
//                                           30,
//                                       child: TextFieldWidget(
//                                         hintText: 'Last name',
//                                         obscureText: false,
//                                         keyboardType: TextInputType.name,
//                                         onChanged: (value) {},
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 heightGap(),
//                                 TextFieldWidgetwithIcon(
//                                     hintText: 'Email',
//                                     keyboardType: TextInputType.emailAddress,
//                                     obscureText: false,
//                                     prefixIconData: Icons.mail_outline,
//                                     onChanged: (value) {
//                                       _email = value;
//                                     },
//                                     validator: (value) {
//                                       Pattern pattern =
//                                           r"[^@\t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+";
//                                       bool validEmail =
//                                           RegExp(pattern).hasMatch(value);
//                                       return !validEmail
//                                           ? 'Invalid email'
//                                           : null;
//                                     }),
//                                 heightGap(),
//                                 TextFieldWidgetwithIcon(
//                                   hintText: 'Password',
//                                   obscureText: _obscureText,
//                                   prefixIconData: Icons.lock_outline,
//                                   suffixIconData: _obscureText
//                                       ? Icons.visibility
//                                       : Icons.visibility_off,
//                                   togglePassword: () => _toggle(),
//                                   onChanged: (value) {
//                                     _password = value;
//                                   },
//                                   validator: (value) => value.length < 6
//                                       ? 'Password too short'
//                                       : null,
//                                 ),
//                                 heightGap(),
//                                 TextFieldWidgetwithIcon(
//                                   hintText: 'Phone',
//                                   keyboardType: TextInputType.number,
//                                   obscureText: false,
//                                   prefixIconData: Icons.phone_android,
//                                   onChanged: (value) {},
//                                   validator: (value) => value.length < 10
//                                       ? 'Incorrect number'
//                                       : null,
//                                 ),
//                                 heightGap(),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Container(
//                                       width: MediaQuery.of(context).size.width *
//                                               0.5 -
//                                           30,
//                                       child: TextFieldWidget(
//                                         hintText: 'City',
//                                         keyboardType: TextInputType.text,
//                                         obscureText: false,
//                                         onChanged: (value) {},
//                                       ),
//                                     ),
//                                     widthGap(),
//                                     Container(
//                                       width: MediaQuery.of(context).size.width *
//                                               0.5 -
//                                           30,
//                                       child: TextFieldWidget(
//                                         hintText: 'State',
//                                         obscureText: false,
//                                         keyboardType: TextInputType.text,
//                                         onChanged: (value) {},
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 heightGap(),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Container(
//                                       width: MediaQuery.of(context).size.width *
//                                               0.5 -
//                                           30,
//                                       child: TextFieldWidget(
//                                         hintText: 'Country',
//                                         keyboardType: TextInputType.text,
//                                         obscureText: false,
//                                         onChanged: (value) {},
//                                       ),
//                                     ),
//                                     widthGap(),
//                                     Container(
//                                       width: MediaQuery.of(context).size.width *
//                                               0.5 -
//                                           30,
//                                       child: TextFieldWidget(
//                                         hintText: 'Zip',
//                                         obscureText: false,
//                                         keyboardType: TextInputType.number,
//                                         onChanged: (value) {},
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 heightGap(),
//                                 ButtonWidget(
//                                   title: 'Sign Up',
//                                   hasBorder: false,
//                                   onPressed: _onClickSignup,
//                                 ),
//                                 heightGap(),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         height: MediaQuery.of(context).size.height * 0.4,
//                         width: MediaQuery.of(context).size.width,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Sign Up",
//                               style: TextStyle(
//                                   color: ColorPalette.cream,
//                                   fontSize: 35,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   void _onClickLogin() async {
//     if (_formKeyLogin.currentState.validate()) {
//       FocusScope.of(context).unfocus();
//       UIUtils().showProgressDialog(context);
//       final result = await _auth.login(_email, _password);
//
//       if (result == null) {
//         setState(() {
//           _error = 'Please check your credentials and try again';
//         });
//       }
//       Future.delayed(Duration(milliseconds: 1500), () {});
//       UIUtils().dismissProgressDialog(context);
//     }
//   }
//
//   // void _onClickSignup() async {
//   //   Navigator.push(
//   //       context,
//   //       MaterialPageRoute(
//   //         builder: (context) => Signup(),
//   //       ));
//   // }
//   void navigateToSignup() {
//     setState(() {});
//   }
//
//   void _onClickSignup() async {
//     FocusScope.of(context).requestFocus(FocusNode());
//     UIUtils().showProgressDialog(context);
//
//     await _auth.signup(_email, _password);
//
//     Future.delayed(Duration(milliseconds: 1500), () {});
//     UIUtils().dismissProgressDialog(context);
//     // Navigator.pushReplacement(
//     //     context, MaterialPageRoute(builder: (context) => Wrapper()));
//   }
// }
//
// Widget heightGap() {
//   return SizedBox(height: 20);
// }
//
// Widget widthGap() {
//   return SizedBox(width: 15);
// }
