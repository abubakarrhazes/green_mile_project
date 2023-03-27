import 'package:flutter/material.dart';
import 'package:green_mile/donation_screens/donation_screen_five.dart';
import 'package:green_mile/donation_screens/donation_screen_four.dart';
import 'package:green_mile/donation_screens/donation_screen_one.dart';
import 'package:green_mile/donation_screens/donation_screen_three.dart';
import 'package:green_mile/donation_screens/donation_screen_two.dart';
import 'package:green_mile/lawyer_screens/lawyer_screen_one.dart';
import 'package:green_mile/lawyer_screens/lawyer_screen_three.dart';
import 'package:green_mile/lawyer_screens/lawyer_screen_two.dart';
import 'package:green_mile/screens/login_screens/forgot_password.dart';
import 'package:green_mile/screens/login_screens/login_page.dart';
import 'package:green_mile/screens/login_screens/register_page.dart';
import 'package:green_mile/screens/onboard_screen/onboard.dart';
import 'package:green_mile/pages/home_page.dart';
import 'package:green_mile/screens/other_screens/card_form_screen.dart';
import 'package:green_mile/screens/other_screens/donation_register_screen.dart';
import 'package:green_mile/screens/other_screens/live_chat.dart';
import 'package:green_mile/sub-screens/emergency_screen.dart';
import 'package:green_mile/sub-screens/expert_screen.dart';

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
        '/': (context) => const HomePage(),
        '/emergency': (context) => const EmergencyScreen(), 
        '/home': (context) => const HomePage(), 
        '/expert': (context) => const ExpertScreen(),
        '/lawyerone': (context) => LawyerScreenOne(),
        '/lawyertwo': (context) => LawyerScreenTwo(),
        '/lawyerthree': (context) => LawyerScreenThree(),
        '/donationone': (context) => const DonationScreenOne(),
        '/donationtwo': (context) => const DonationScreenTwo(),
        '/donationthree': (context) => const DonationScreenThree(),
        '/donationfour': (context) => const DonationScreenFour(),
        '/donationfive': (context) => const DonationScreenFive(),
        '/donationScreen': (context) => const DonationRegisterScreen(),
        '/livechat': (context) => const LiveChatScreen(),
        '/cardform': (context) => const CardFormScreen(),
        
       
      },
    );
  }
}
