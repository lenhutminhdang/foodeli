import 'package:ct484_project/pages/cart_page.dart';
import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.grey.shade200,
      foregroundColor: Colors.grey.shade600,
      title: Center(child: Text('Trang Chủ', style: TextStyle(color: Colors.grey.shade600))),
      expandedHeight: 250,
      collapsedHeight: 100,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              )
            );
          }, 
          icon: const Icon(Icons.shopping_cart)
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: child,
        title: title,
        centerTitle: true,
        expandedTitleScale: 1,
        titlePadding: const EdgeInsets.only( left: 0, top: 0, bottom: 0, right: 0),
      ),
    );
  }
}