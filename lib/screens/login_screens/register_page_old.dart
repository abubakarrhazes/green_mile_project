import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:green_mile/providers/auth_provider.dart';
import 'package:green_mile/utils/network_controller.dart';
import 'package:green_mile/widgets/feedback.dart';

import '../../utils/validators.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/wait_dialog.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final Map<String, String?> formResult = {};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = NetworkController();
  // final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/image_2.png',
                  height: 150,
                ),
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) => Validators.validateName(value),
                          onSaved: (newValue) => formResult['name'] = newValue,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            hintText: 'Enter Your Name Here',
                            suffix: const Icon(Icons.person_outline),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          validator: (value) => Validators.validateEmail(value),
                          onSaved: (newValue) => formResult['email'] = newValue,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter Your Email',
                            suffix: const Icon(Icons.mail_outline),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          autocorrect: false,
                          enableSuggestions: false,
                          controller: passwordController,
                          validator: (value) =>
                              Validators.validatePassword(value),
                          onSaved: (newValue) =>
                              formResult['password'] = newValue,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter Your Password Here',
                            prefix: Icon(Icons.lock_outline),
                            suffix: Icon(Icons.visibility),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          autocorrect: false,
                          enableSuggestions: false,
                          validator: (value) => Validators.validatePassword(
                              value, passwordController.text),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Confirm  Password Here',
                            prefix: const Icon(Icons.lock_outline),
                            suffix: const Icon(Icons.visibility),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ButtonWidget(
                          onPress: _submitForm,
                          text: 'Sign Up',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(formResult);

      bool waiting = true;
      showWaitDialog(context).then((value) => waiting = true);
      String? errorMessage = await AuthProvider.registerUser(
          formResult['name']!, formResult['email']!, formResult['password']!);

      if (errorMessage == null) {
        log('Registration successful');
        showSuccess(context, 'Registration Succesfully');

        if (!mounted) return;
        // Dismiss waiting dialog
        if (waiting) Navigator.of(context).pop();
        Navigator.pushNamed(context, '/login');
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
