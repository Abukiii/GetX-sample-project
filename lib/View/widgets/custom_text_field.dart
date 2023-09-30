import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String hintText;
  final bool isObscureText;
   final FocusNode? focusNode;
   var suffix;

  CustomTextField({
    required this.controller,
    required this.onChanged,
    required this.hintText,
    this.isObscureText = false,
    this.focusNode,
    required this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
  controller: controller,
  onChanged: onChanged,
  obscureText: isObscureText,
  cursorColor: Colors.black,
  focusNode: focusNode,
   decoration: InputDecoration(
    labelText: hintText,
    hintText: hintText,
    labelStyle: TextStyle(color: Colors.grey),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
      focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    suffixIcon: suffix
  ),
  
);
  }
}

