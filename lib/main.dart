import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:green_mile/screens/donation_screens/donation_screen_five.dart';
import 'package:green_mile/screens/donation_screens/donation_screen_four.dart';
import 'package:green_mile/screens/donation_screens/donation_screen_one.dart';
import 'package:green_mile/screens/donation_screens/donation_screen_three.dart';
import 'package:green_mile/screens/donation_screens/donation_screen_two.dart';
import 'package:green_mile/screens/lawyer_screens/lawyer_screen_one.dart';
import 'package:green_mile/screens/lawyer_screens/lawyer_screen_three.dart';
import 'package:green_mile/screens/lawyer_screens/lawyer_screen_two.dart';
import 'package:green_mile/screens/login_screens/forgot_password.dart';
import 'package:green_mile/screens/login_screens/login_page.dart';
import 'package:green_mile/screens/onboard_screen/onboard.dart';
import 'package:green_mile/screens/other_screens/card_form_screen.dart';
import 'package:green_mile/screens/other_screens/donation_register_screen.dart';
import 'package:green_mile/screens/other_screens/live_chat.dart';
import 'package:green_mile/screens/pages/home_page.dart';
import 'package:green_mile/sub-screens/emergency_screen.dart';
import 'package:green_mile/sub-screens/expert_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        '/login': (context) => const LoginPage(),
        '/forgot': (context) => const ForgotPassword(),
        '/emergency': (context) => const EmergencyScreen(),
        '/home': (context) => const HomePage(),
        '/expert': (context) => const ExpertScreen(),
        '/lawyer_1': (context) => LawyerScreenOne(),
        '/lawyer_2': (context) => LawyerScreenTwo(),
        '/lawyer_3': (context) => LawyerScreenThree(),
        '/donation_1': (context) => const DonationScreenOne(),
        '/donation_2': (context) => const DonationScreenTwo(),
        '/donation_3': (context) => const DonationScreenThree(),
        '/donation_4': (context) => const DonationScreenFour(),
        '/donation_5': (context) => const DonationScreenFive(),
        '/donationScreen': (context) => const DonationRegisterScreen(),
        '/livechat': (context) => const LiveChatScreen(),
        '/cardform': (context) => const CardFormScreen(),
      },
    );
  }
}
