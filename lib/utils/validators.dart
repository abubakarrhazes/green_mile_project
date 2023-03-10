import 'dart:developer';

import 'package:flutter/material.dart';

class Validators {
  static validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name can\'t be empty';
    } else if (name.length < 3) {
      return 'Name too short';
    }
  }

  static validateEmail(String? email) {
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email == null || email.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }
  }

  static validatePassword(String? password, [String? compare]) {
    if (password == null || password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (compare != null && password != compare) {
      return 'Password mismatch';
    } else if (password.length < 6) {
      return 'Enter a password of length more than 5';
    }
  }
}
