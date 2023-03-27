import 'package:flutter/material.dart';
import 'package:green_mile/donation_screens/donation_screen_five.dart';
import 'package:green_mile/donation_screens/donation_screen_four.dart';
import 'package:green_mile/donation_screens/donation_screen_one.dart';
import 'package:green_mile/donation_screens/donation_screen_three.dart';
import 'package:green_mile/donation_screens/donation_screen_two.dart';
import 'package:green_mile/lawyer_screens/lawyer_screen_one.dart';
import 'package:green_mile/lawyer_screens/lawyer_screen_three.dart';
import 'package:green_mile/lawyer_screens/lawyer_screen_two.dart';
import 'package:green_mile/pages/home_page.dart';
import 'package:green_mile/screens/login_screens/forgot_password.dart';
import 'package:green_mile/screens/login_screens/login_page.dart';
import 'package:green_mile/screens/login_screens/register_page.dart';
import 'package:green_mile/screens/onboard_screen/onboard.dart';
import 'package:green_mile/pages/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Green Mile Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
       /*   '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/forgot': (context) => const ForgotPassword(), */
      },
    );
  }
}
