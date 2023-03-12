import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_mile/screens/home_page.dart';
import 'package:green_mile/screens/login_screens/forgot_password.dart';
import 'package:green_mile/screens/login_screens/forgot_password_sent.dart';
import 'package:green_mile/screens/login_screens/login_page.dart';
import 'package:green_mile/screens/login_screens/register_page.dart';
import 'package:green_mile/screens/onboard_screen/onboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'screens/home_page.dart';

bool shouldUseFirebaseEmulator = false;
int? isViewed;
bool onDevMode = true;

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onboard');

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
      initialRoute: onDevMode
          ? '/'
          : isViewed != 0
              ? '/'
              : '/login',
      routes: {
        '/': (context) => const Onboard(),
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/forgot': (context) => const ForgotPassword(),
        '/forgotSent': (context) => const ForgotPasswordSent(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
