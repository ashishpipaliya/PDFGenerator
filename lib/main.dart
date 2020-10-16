import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pdf_gen/pages/form_page/form_page.dart';
import 'package:pdf_gen/pages/landing_page.dart';
import 'package:pdf_gen/services/auth.dart';
import 'package:pdf_gen/shared/color_palette.dart';
import 'package:pdf_gen/wrapper/wrapper.dart';
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
          primarySwatch: customSwatch,
          scaffoldBackgroundColor: ColorPalette.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
            },
          ),
        ).copyWith(textSelectionHandleColor: ColorPalette.darkPurple),
        home: Wrapper(),
      ),
    );
  }
}
