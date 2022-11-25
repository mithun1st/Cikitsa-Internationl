import 'package:doctime/home_page.dart';
import 'package:doctime/ui/otp_verification_screen.dart';
import 'package:doctime/ui/theme/theme.dart';
import 'package:doctime/ui/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: THEMEDATA,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: LoginScreen(),
      routes: {
        '/': (context) => LoginScreen(),
        OtpVerificatonScreen.pageName: (context) => OtpVerificatonScreen(),
        MyHomePage.pageName: (context) => MyHomePage(),
      },
      // home: MyHomePage(),
    );
  }
}
