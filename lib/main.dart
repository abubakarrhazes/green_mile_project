import 'package:flutter/material.dart';
import 'package:green_mile/screens/login_screens/forgot_password.dart';
import 'package:green_mile/screens/login_screens/login_page.dart';
import 'package:green_mile/screens/login_screens/register_page.dart';
import 'package:green_mile/screens/onboard_screen/onboard.dart';

void main() {
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
        '/': (context) => const Onboard(),
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/forgot': (context) => const ForgotPassword(),
      },
    );
  }
}
