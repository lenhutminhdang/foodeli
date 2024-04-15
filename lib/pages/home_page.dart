import 'package:ct484_project/components/app_drawer.dart';
import 'package:ct484_project/components/current_location.dart';
import 'package:ct484_project/components/description_box.dart';
import 'package:ct484_project/components/food_tile.dart';
import 'package:ct484_project/components/my_sliver_app_bar.dart';
import 'package:ct484_project/components/my_tab_bar.dart';
import 'package:ct484_project/models/food.dart';
import 'package:ct484_project/models/restaurant.dart';
import 'package:ct484_project/pages/food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: FoodTile(
              food: food, 
              onTap: () => Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => FoodPage(food: food)
                )
              )
            ),
          );
        }
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Trang Chủ', style: TextStyle(color: Colors.grey.shade600),)
      // ),
      drawer: const AppDrawer(),
      backgroundColor: Colors.grey.shade200,
      body: NestedScrollView(
        headerSliverBuilder: ((context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController), 
            child: const Padding(
              padding: EdgeInsets.only(top: 48, bottom: 64, right: 0, left: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CurrentLocation(),

                  DescriptionBox()
                ],
              ),
            )
          )
        ]),
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu)
          )
        ),
      ),
    );
  }
}