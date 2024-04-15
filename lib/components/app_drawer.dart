import 'package:ct484_project/pages/my_orders_page.dart';
import 'package:ct484_project/pages/search_food_page.dart';
import 'package:flutter/material.dart';
import 'package:ct484_project/components/app_drawer_tile.dart';
import 'package:ct484_project/components/logo.dart';
import 'package:ct484_project/services/auth/auth_service.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void logout() {
    // get auth service
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade200,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // App Logo
          const Padding(
            padding: EdgeInsets.only(top: 64, bottom: 24),
            child: Logo()
          ), 

          // List Tiles
          AppDrawerTile(
            text: 'Trang Chủ', 
            icon: Icons.home, 
            onTap: () => Navigator.pop(context) 
          ),

          AppDrawerTile(
            text: 'Tìm Kiếm', 
            icon: Icons.search, 
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const SearchFoodPage())
            ) 
          ),

          AppDrawerTile(
            text: 'Đơn Hàng', 
            icon: Icons.list_alt, 
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const MyOrdersPage())
            ) 
          ),

          const Spacer(),
          
          AppDrawerTile(
            text: 'Đăng Xuất', 
            icon: Icons.logout, 
            onTap: logout 
          ),

          const SizedBox(height: 24)
        
        ],
      ),
    );
  }
}