import 'package:ct484_project/models/food.dart';
import 'package:ct484_project/utils/utils.dart';
import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)
        ),
        surfaceTintColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(food.imageURL, fit: BoxFit.cover),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Food name
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    food.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Food price
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    formatCurrency(food.price),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade400
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}