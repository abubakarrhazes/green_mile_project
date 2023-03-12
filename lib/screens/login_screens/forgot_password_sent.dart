import 'package:flutter/material.dart';

class ForgotPasswordSent extends StatelessWidget {
  const ForgotPasswordSent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.email_outlined, color: Colors.grey, size: 64),
          Padding(
            padding: EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 8),
            child: Text(
                'Steps to follow to make a successful change of your password has been sent to your email. Kindly follow the steps as guided'),
          )
        ],
      )),
    );
  }
}
