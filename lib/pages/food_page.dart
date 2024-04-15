import 'package:ct484_project/components/form/button.dart';
import 'package:ct484_project/models/food.dart';
import 'package:ct484_project/models/restaurant.dart';
import 'package:ct484_project/pages/cart_page.dart';
import 'package:ct484_project/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  const FoodPage({super.key, required this.food});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  
  void addToCart(Food food) {
    // Go back to homepage
    Navigator.pop(context);
    // Go to cartpage
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => const CartPage(),
      )
    );
    context.read<Restaurant>().addToCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chi tiết'), backgroundColor: Colors.white, centerTitle: true,),
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        children: [
          Column(
            children: [
              // Image
              Image.asset(widget.food.imageURL),

              // Content
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatCurrency(widget.food.price), 
                      style: TextStyle(
                        fontSize: 24, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.orange.shade500
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.food.name, 
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.food.description,
                      style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),

              // Button Add to cart
              Button(label: 'Add to cart', onTap: () => addToCart(widget.food)),

              const SizedBox(height: 32,)

            ],
          )
        ],
      ),
    );
  }
}