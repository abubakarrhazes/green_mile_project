// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, must_be_immutable, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_mile/providers/auth_provider.dart';
import 'package:green_mile/utils/validators.dart';
import 'package:green_mile/widgets/optional_login.dart';
import 'package:green_mile/widgets/wait_dialog.dart';

import '../../widgets/button_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPassword = false;
  final formResult = <String, String?>{};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.deepPurpleAccent,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                                color: Colors.deepPurpleAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Welcome Back !',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                OptionalLogin(
                    onPress: () => AuthProvider.loginWithGoogle(),
                    image: 'assets/images/google.png',
                    text: "Login With Goggle"),
                SizedBox(
                  height: 20,
                ),
                OptionalLogin(
                    onPress: () => loginWith(AuthProvider.loginWithTwitter),
                    image: 'assets/images/twitter.png',
                    text: "Login With Twitter"),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      color: Colors.deepPurpleAccent,
                      thickness: 2,
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Login Via',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.deepPurpleAccent,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) => Validators.validateEmail(value),
                          onSaved: (newValue) => formResult['email'] = newValue,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter Your Email Here',
                            suffix: Icon(Icons.mail_outline),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          validator: (value) =>
                              Validators.validatePassword(value),
                          onSaved: (newValue) =>
                              formResult['password'] = newValue,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter Your Password Here',
                            prefix: Icon(Icons.lock_outline),
                            suffix: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              child: Icon(
                                showPassword == false
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 25,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ButtonWidget(
                          onPress: _submitForm,
                          text: 'Sign In',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/forgot');
                  },
                  child: Text(
                    "Forgot Password ? Reset Here ",
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  loginWith(Future<String?> Function()? method, {bool withForm = false}) async {
    bool waiting = true;
    showWaitDialog(context).then((value) => waiting = false);
    String? errorMessage;
    if (withForm) {
      errorMessage = await AuthProvider.loginUser(
          formResult['email']!, formResult['password']!);
    } else {
      errorMessage = await method!();
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

  _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      loginWith(null, withForm: true);
    }
  }
}
