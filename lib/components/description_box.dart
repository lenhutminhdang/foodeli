import 'package:ct484_project/utils/utils.dart';
import 'package:flutter/material.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Phí giao hàng tiêu chuẩn', style: TextStyle(fontSize: 16, color: Colors.grey.shade600),),
        Text(formatCurrency(30000), style: TextStyle(fontSize: 16, color: Colors.grey.shade600),),
      ],
    );
  }
}