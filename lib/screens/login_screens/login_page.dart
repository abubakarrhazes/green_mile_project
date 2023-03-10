// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, must_be_immutable, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:green_mile/utils/validators.dart';
import 'package:green_mile/widgets/optional_login.dart';

import '../../widgets/button_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool showPassword = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                            border: Border.all(color: Colors.deepPurpleAccent),
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
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2),
                ),
                SizedBox(
                  height: 20,
                ),
                OptionalLogin(
                    loginAction: () {
                      //Code Here
                    },
                    image:
                        "https://cdn-icons-png.flaticon.com/512/2702/2702602.png",
                    text: "Login With Goggle"),
                SizedBox(
                  height: 20,
                ),
                OptionalLogin(
                    loginAction: () {
                      //Code Here
                    },
                    image:
                        "https://cdn-icons-png.flaticon.com/512/733/733579.png",
                    text: "Login With Twitter"),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                      color: Colors.deepPurpleAccent,
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
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          validator: (value) =>
                              Validators.validateEmail("${emailController}"),
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
                          controller: passwordController,
                          validator: (value) => Validators.validatePassword(
                              "$passwordController"),
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
                          onPress: () {
                            if (_formkey.currentState!.validate()) {
                              Navigator.pushNamed(context, '/home');
                            }
                          },
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
}
