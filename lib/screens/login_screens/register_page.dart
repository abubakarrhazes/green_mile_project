import 'package:flutter/material.dart';

import '../../utils/validators.dart';
import '../../widgets/button_widget.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const Text('Create An Account',
                  style: TextStyle(color: Colors.black)),
              Image.asset(
                'assets/scale.png',
                height: 150,
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
                          labelText: 'Email',
                          hintText: 'Enter Your Email Here',
                          suffix: Icon(Icons.mail_outline),
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
                      ButtonWidget(
                        text: 'Create Account',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
