import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.apple, color: Colors.red, size: 36),  
        Padding(
          padding: EdgeInsets.only(top: 6.0),
          child: Text('F O O D E L I', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w600, fontSize: 24)),
        )
      ],
    );
  }
}