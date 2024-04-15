import 'package:ct484_project/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Receipt extends StatelessWidget {
  const Receipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, right: 25, bottom: 25, left: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Đơn hàng thanh toán thành công!', style: TextStyle(fontSize: 20),),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(restaurant.displayCartReceipt(), style: TextStyle(fontSize: 18, color: Colors.grey.shade700),),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}