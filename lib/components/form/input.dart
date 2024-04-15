import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String placeHolder;
  final bool obscureText;

  const Input({
    super.key, 
    required this.controller, 
    required this.placeHolder, 
    required this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade600)
          ),
          hintText: placeHolder,
          hintStyle: TextStyle(color: Colors.grey.shade400)
        ),
        
      ),
    );
  }
}