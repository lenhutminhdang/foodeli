import 'package:flutter/material.dart';

class SearchFoodPage extends StatefulWidget {
  const SearchFoodPage({super.key});

  @override
  State<SearchFoodPage> createState() => _SearchFoodPageState();
}

class _SearchFoodPageState extends State<SearchFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang tìm kiếm món ăn'),
      ),
    );
  }
}