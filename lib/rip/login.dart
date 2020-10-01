// import 'package:flare_flutter/flare_actor.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'file:///C:/Users/ashis/Documents/Flutter/Agile%20Infoways/pdf_gen/lib/services/auth.dart';
// import 'file:///C:/Users/ashis/Documents/Flutter/Agile%20Infoways/pdf_gen/lib/pages/forgot_password.dart';
// import 'file:///C:/Users/ashis/Documents/Flutter/Agile%20Infoways/pdf_gen/lib/pages/signup.dart';
// import 'package:pdf_gen/shared/color_palette.dart';
// import 'package:pdf_gen/utils/ui_utils.dart';
// import 'package:pdf_gen/widgets/button_widget.dart';
// import 'package:pdf_gen/widgets/textfield_widget.dart';
//
// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   String _email;
//   String _password;
//   String _error;
//   final _formKey = GlobalKey<FormState>();
//
//   bool _obscureText = true;
//
//   void _toggle() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }
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
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         body: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Stack(
//             children: [
//               Container(
//                 height: height * 0.5,
//                 child: Opacity(
//                   opacity: 1,
//                   child: FlareActor(
//                     'assets/flare/flow.flr',
//                     animation: "Flow",
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               Container(
//                 width: width,
//                 height: height,
//                 child: Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         TextFieldWidgetwithIcon(
//                             hintText: 'Email',
//                             keyboardType: TextInputType.emailAddress,
//                             obscureText: false,
//                             prefixIconData: Icons.mail_outline,
//                             onChanged: (value) {
//                               _email = value;
//                             },
//                             validator: (value) {
//                               Pattern pattern =
//                                   r"[^@\t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+";
//                               bool validEmail = RegExp(pattern).hasMatch(value);
//
//                               return !validEmail ? 'Invalid email' : null;
//                             }),
//                         heightGap(),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             TextFieldWidgetwithIcon(
//                               hintText: 'Password',
//                               obscureText: _obscureText,
//                               prefixIconData: Icons.lock_outline,
//                               suffixIconData: _obscureText
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               togglePassword: () => _toggle(),
//                               onChanged: (value) {
//                                 _password = value;
//                               },
//                               validator: (value) => value.length < 6
//                                   ? 'Password too short'
//                                   : null,
//                             ),
//                             FlatButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             ForgetPassword()));
//                               },
//                               child: Text(
//                                 'Forgot password',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w300,
//                                     color: ColorPalette.darkPurple),
//                               ),
//                             )
//                           ],
//                         ),
//                         heightGap(),
//                         Text(_error ?? '',
//                             style: UIUtils()
//                                 .getTextStyle(color: ColorPalette.errorRed)),
//                         heightGap(),
//                         ButtonWidget(
//                           title: 'Login',
//                           hasBorder: false,
//                           onPressed: _onClickLogin,
//                           // onPressed: () async {
//                           //   // await _auth.login(_email, _password);
//                           // },
//                         ),
//                         heightGap(),
//                         ButtonWidget(
//                           title: 'Sign Up',
//                           hasBorder: true,
//                           onPressed: _onClickSignup,
//                         ),
//                         heightGap(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 height: height * 0.4,
//                 width: width,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Login",
//                       style: TextStyle(
//                           color: ColorPalette.superlightPurple,
//                           fontSize: width * 0.1,
//                           fontWeight: FontWeight.w600),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _onClickLogin() async {
//     if (_formKey.currentState.validate()) {
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
//   void _onClickSignup() async {
//     FocusScope.of(context).unfocus();
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => Signup(),
//         ));
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
