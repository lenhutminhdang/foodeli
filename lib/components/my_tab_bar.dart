import 'package:flutter/material.dart';
import 'package:ct484_project/models/food.dart';
import 'package:ct484_project/utils/utils.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        // map category name to Vietnamese
        text: getCategoryName(category),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTabs(),
        indicatorColor: Colors.orange,
        labelColor: Colors.orange,
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        isScrollable: true,
        tabAlignment: TabAlignment.center,
      ),
    );
  }
}