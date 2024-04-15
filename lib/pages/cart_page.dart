import 'package:ct484_project/components/cart_tile.dart';
import 'package:ct484_project/components/form/button.dart';
import 'package:ct484_project/models/restaurant.dart';
import 'package:ct484_project/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;

        Widget renderedContent = Expanded(
          child: Center(
            child: Text(
              'Giò hàng trống', 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 18
              ),
            ),
          )
        );

        if(userCart.isNotEmpty) {
          renderedContent = Expanded(
            child: ListView.builder(
              itemCount: userCart.length,
              itemBuilder: (context, index) => CartTile(cartItem: userCart[index])
            )
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Giỏ hàng'), 
            backgroundColor: Colors.grey.shade200,
            actions: [
              // Clear cart button
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context, 
                    builder: (context) => AlertDialog(
                      title: const Text("Bạn có muốn xóa toàn bộ giỏ hàng?"),
                      actionsAlignment: MainAxisAlignment.spaceAround,
                      actions: [
                        // Cancel button
                        MaterialButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Hủy', style: TextStyle(fontSize: 18),),
                        ),
                        // Delete button
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          color: Colors.orange,
                          child: const Text('Xóa', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                        )
                      ],
                    )
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Text(
                    'Xóa tất cả',
                    style: TextStyle(
                      color: Colors.orange.shade700,
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
          backgroundColor: Colors.grey.shade200,
          body: Column(
            children: [
              // List of cart item
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    renderedContent
                  ],
                ),
              ),

              // button to payment page
              userCart.isNotEmpty 
              ? Button(
                  label: 'Mua hàng ngay', 
                  onTap: () => Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const PaymentPage())
                  ),
                ) 
              : const SizedBox(),

              userCart.isNotEmpty 
              ? const SizedBox(height: 24,)
              : const SizedBox(),
            ],
          )
        );
      },
    );
  }
}