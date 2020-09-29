import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/pages/login_redesign.dart';
import 'package:pdf_gen/pages/profile.dart';
import 'package:pdf_gen/pages/signup_redesign.dart';
import 'file:///C:/Users/ashis/Documents/Flutter/Agile%20Infoways/pdf_gen/lib/services/auth.dart';
import 'file:///C:/Users/ashis/Documents/Flutter/Agile%20Infoways/pdf_gen/lib/wrapper/wrapper.dart';
import 'package:pdf_gen/shared/color_palette.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthProvider().user,
      child: MaterialApp(
        title: 'PDF Generator',
        theme: ThemeData(
          primaryColor: ColorPalette.white,
          scaffoldBackgroundColor: ColorPalette.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
            },
          ),
        ).copyWith(textSelectionHandleColor: ColorPalette.darkPurple),
        home: Profile(),
        // home: Wrapper(),
      ),
    );
  }
}
