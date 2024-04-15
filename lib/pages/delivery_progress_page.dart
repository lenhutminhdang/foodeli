import 'package:ct484_project/components/form/button.dart';
import 'package:ct484_project/components/receipt.dart';
import 'package:ct484_project/models/restaurant.dart';
import 'package:ct484_project/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Đơn hàng của bạn'), 
            backgroundColor: Colors.grey.shade200,
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          backgroundColor: Colors.grey.shade200,
          body: Column(
            children: [
              const Column(
                children: [
                  Receipt()
                ],
              ),

              const Spacer(),

              Button(label: "Trở về trang chủ", onTap: () {
                // Clear cart
                restaurant.clearCart();

                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const HomePage())
                );
              }),

              const SizedBox(height: 20)
            ],
          ),
        );
      },
    );
  }
}