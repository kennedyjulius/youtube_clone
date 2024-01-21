import 'package:flutter/material.dart';

class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }
    return null;
  }

  static String? validateConfrimPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please your email do not match";
    }
    return null;
  }

}
