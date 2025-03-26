import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextStyle textStyle;
  final TextInputType keyboardType;
  final bool obscureText;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String)? onChanged;
  final String? Function(dynamic value)? validator;

  CustomTextField({
    required this.controller,
    required this.labelText,
    required this.textStyle,
    required this.keyboardType,
    this.obscureText = false,
    this.onChanged,
     this.validator,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: textStyle,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: contentPadding,
        border: OutlineInputBorder(),
      ),
    );
  }
}
