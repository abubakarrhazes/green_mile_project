// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:green_mile/widgets/button_widget.dart';

import '../../widgets/text_input_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.deepPurpleAccent,
                      size: 35,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/5618/5618714.png',
                height: 150,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Enter Email Address Used For Registration A Link Will be Sent To This Email",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                child: Column(
                  children: [
                    TextInputField(
                      hintText: 'Enter Your Email Here',
                      labelText: 'Email',
                      prefix: Icon(Icons.mail_outline),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonWidget(
                      onPress: () {},
                      text: 'Request Link',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
