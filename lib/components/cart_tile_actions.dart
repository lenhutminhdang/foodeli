import 'package:ct484_project/models/food.dart';
import 'package:flutter/material.dart';

class CartTileActions extends StatelessWidget {
  final Food food;
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartTileActions({
    super.key,
    required this.food,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Decrease food quantity button
          GestureDetector(
            onTap: onIncrease,
            child: Icon(Icons.remove, size: 20, color: Colors.grey.shade900),
          ),
          // food quantity
          SizedBox(
            width: 20,
            child: Text(
              quantity.toString(), 
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          // Increase food quantity button
          GestureDetector(
            onTap: onDecrease,
            child: Icon(Icons.add, size: 20, color: Colors.grey.shade900),
          ),

        ],
      ),
    );
  }
}