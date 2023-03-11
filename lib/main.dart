import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:green_mile/screens/login_screens/forgot_password_sent.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:green_mile/screens/login_screens/forgot_password.dart';
import 'package:green_mile/screens/login_screens/login_page.dart';
import 'package:green_mile/screens/login_screens/register_page.dart';
import 'package:green_mile/screens/onboard_screen/onboard.dart';

bool shouldUseFirebaseEmulator = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (shouldUseFirebaseEmulator) {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }

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
        '/forgotSent': (context) => const ForgotPasswordSent(),
      },
    );
  }
}
