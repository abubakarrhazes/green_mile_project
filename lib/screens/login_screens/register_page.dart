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
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Create An Account',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Image.network(
                  'https://cdn-icons-png.flaticon.com/512/7458/7458316.png',
                  height: 150),
              const SizedBox(
                height: 20,
              ),
              Form(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        validator: (value) =>
                            Validators.validateEmail("$emailController"),
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter Your Name Here',
                          suffix: const Icon(Icons.person_2_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.transparent)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) =>
                            Validators.validatePassword("$passwordController"),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter Your Email',
                          suffix: const Icon(Icons.mail_outline),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.transparent)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) =>
                            Validators.validatePassword("$passwordController"),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter Your Password Here',
                          prefix: Icon(Icons.lock_outline),
                          suffix: Icon(Icons.visibility),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.transparent)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) =>
                            Validators.validatePassword("$passwordController"),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Confirm  Password Here',
                          prefix: const Icon(Icons.lock_outline),
                          suffix: const Icon(Icons.visibility),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.transparent)),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ButtonWidget(
                        route: () {},
                        text: 'Create Account',
                      ),
                    ],
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
