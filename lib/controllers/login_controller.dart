import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
    final emailController = TextEditingController();

  // Define an RxBool to hold the email validation result
  final isEmailValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Listen to changes in the emailController and validate the email
    emailController.addListener(() {
      validateEmail(emailController.text);
    });
  }

  // Method to validate email
  void validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    final isValid = emailRegex.hasMatch(email);
    isEmailValid.value = isValid;
  }

  void login() {
    if (isEmailValid.value) {
      print('Email is valid');
    } else {
      print('Email is not valid');
    }
  }

  @override
  void onClose() {
    // Dispose of the emailController to avoid memory leaks
    emailController.dispose();
    super.onClose();
  }
}