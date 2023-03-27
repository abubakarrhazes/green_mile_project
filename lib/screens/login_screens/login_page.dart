import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_mile/utils/validators.dart';

import '../../providers/auth_provider.dart';
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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                      'Login',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.black54),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Expanded(
                            child: Divider(
                                indent: 18, endIndent: 12, thickness: 1.5)),
                        Text(
                          'via',
                          style: TextStyle(color: Colors.black45),
                        ),
                        Expanded(
                            child: Divider(
                                indent: 12, endIndent: 18, thickness: 1.5))
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkResponse(
                            onTap: () =>
                                loginWith(AuthProvider.loginWithGoogle),
                            child: Image.asset(
                              'assets/images/google.png',
                            ),
                          ),
                          const SizedBox(width: 32),
                          InkResponse(
                            onTap: () =>
                                loginWith(AuthProvider.loginWithTwitter),
                            child: Image.asset(
                              'assets/images/twitter.png',
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      children: [
                        Expanded(
                            child: Divider(
                                indent: 18, endIndent: 12, thickness: 1.5)),
                        Text(
                          'or',
                          style: TextStyle(color: Colors.black45),
                        ),
                        Expanded(
                            child: Divider(
                                indent: 12, endIndent: 18, thickness: 1.5))
                      ],
                    ),
                    const SizedBox(height: 18),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
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
                            const SizedBox(height: 20),
                            CupertinoButton.filled(
                                // color: Colors.black,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 22),
                                borderRadius: BorderRadius.circular(24),
                                onPressed: _submitForm,
                                child: const Text(
                                  'Login',
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
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot');
                    },
                    child: const Text('Reset Password')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        'Create one',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
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
      loginWith(null, withForm: true);
    }
  }

  loginWith(Future<String?> Function()? method, {bool withForm = false}) async {
    bool waiting = true;
    showWaitDialog(context).then((value) => waiting = false);
    String? errorMessage;
    if (withForm) {
      errorMessage = await AuthProvider.loginUser(
          formResult['email']!, formResult['password']!);
    } else {
      try {
        errorMessage = await method!();
      } catch (e) {
        log('login error', name: 'loginWith', error: e);
        if (!mounted) return;
        // Dismiss waiting dialog
        if (waiting) Navigator.pop(context);
        return;
      }
    }
    if (!mounted) return;
    // Dismiss waiting dialog
    if (waiting) Navigator.pop(context);
    if (errorMessage == null) {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(errorMessage!),
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
