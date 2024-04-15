import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onTap;
  final String label;

  const Button({super.key, required this.label,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        margin: const EdgeInsets.symmetric( horizontal: 24.0),
        decoration: BoxDecoration(
          // color: Colors.yellow.shade300,
          color: Colors.orange.shade300,
          borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child: Center(
          child: Text(label, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey.shade800),),
        ),
      ),
      
    );
  }
}