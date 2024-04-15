import 'package:ct484_project/components/cart_tile_actions.dart';
import 'package:ct484_project/models/cart_item.dart';
import 'package:ct484_project/models/restaurant.dart';
import 'package:ct484_project/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;
  const CartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(14))
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            // Every cart tile
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(cartItem.food.imageURL, height: 120,),
                  ),
                  // Name and price
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.food.name, 
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12,),
                        Text(formatCurrency(cartItem.food.price)),
                        const SizedBox(height: 12,),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Container(
                            color: Colors.orange.shade200,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                              child: Text(
                                // getCategoryName(cartItem.food.category)
                                'Tổng: ${formatCurrency(cartItem.totalPrice)}', 
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700)
                              ),      
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // Actions
                  CartTileActions(
                    food: cartItem.food, 
                    quantity: cartItem.quantity, 
                    onIncrease: () {
                      restaurant.removeFromCart(cartItem);
                    }, 
                    onDecrease: () {
                      restaurant.addToCart(cartItem.food);
                    }
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}