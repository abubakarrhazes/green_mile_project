import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_mile/utils/validators.dart';

import '../../providers/auth_provider.dart';
import '../../widgets/feedback.dart';
import '../../widgets/text_input_field.dart';
import '../../widgets/wait_dialog.dart';

const MaterialColor black = MaterialColor(
  0xFF000000,
  <int, Color>{
    50: Color(0xFFEEEEEE),
    100: Color(0xFFBBBBBB),
    200: Color(0xFF999999),
    300: Color(0xFF555555),
    400: Color(0xFF333333),
    500: Color(0xFF000000),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();
  final formResult = {};

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 4,
            child: Image.asset('assets/images/image_2.png'),
          ),
          Card(
            margin: const EdgeInsets.only(left: 22, right: 22),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Theme(
              data: ThemeData(primarySwatch: black),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Text(
                      'Create Account',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.black54),
                    ),
                    const SizedBox(height: 18),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            MyInputField(
                              hintText: 'Name',
                              keyboardType: TextInputType.name,
                              validator: (p0) => Validators.validateName(p0),
                              onSaved: (p0) => formResult['name'] = p0,
                            ),
                            const SizedBox(height: 15),
                            MyInputField(
                              hintText: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              validator: (p0) => Validators.validateEmail(p0),
                              onSaved: (p0) => formResult['email'] = p0,
                            ),
                            const SizedBox(height: 15),
                            MyInputField(
                              hintText: 'Password',
                              isPassword: true,
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordController,
                              validator: (p0) =>
                                  Validators.validatePassword(p0),
                              onSaved: (p0) => formResult['password'] = p0,
                            ),
                            const SizedBox(height: 15),
                            MyInputField(
                              hintText: 'Retype password',
                              isPassword: true,
                              validator: (p0) => Validators.validatePassword(
                                  p0, passwordController.text),
                            ),
                            const SizedBox(height: 20),
                            CupertinoButton.filled(
                                // color: Colors.black,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 22),
                                borderRadius: BorderRadius.circular(24),
                                onPressed: _submitForm,
                                child: const Text(
                                  'Register',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ))
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding:
                const EdgeInsets.only(top: 24, bottom: 16, left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account? '),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  void _submitForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      bool waiting = true;
      showWaitDialog(context).then((value) => waiting = true);
      String? errorMessage = await AuthProvider.registerUser(
          formResult['name']!, formResult['email']!, formResult['password']!);

      if (errorMessage == null) {
        log('Registration successful');

        if (!mounted) return;
        showSuccess(context, 'Registration Successful');
        // Dismiss waiting dialog
        if (waiting) Navigator.of(context).pop();
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        if (!mounted) return;
        if (waiting) Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(errorMessage),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Okay'))
            ],
          ),
        );
      }
    }
  }
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      // cardTheme: CardTheme(color: Colors.black)
    ),
    home: RegisterPage(),
  ));
}
