import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obscureText;

  const CustomInputField({
    Key? key,
    required this.label,
    required this.icon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        suffixIcon: obscureText ? Icon(Icons.visibility_off) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}