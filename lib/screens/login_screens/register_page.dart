import 'package:flutter/material.dart';
import 'package:green_mile/utils/network_controller.dart';

import '../../utils/validators.dart';
import '../../widgets/button_widget.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final controller = NetworkController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
