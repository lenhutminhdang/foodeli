class Food {
  final String name;
  final String description;
  final String imageURL;
  final double price;
  final FoodCategory category;

  Food({
    required this.name,
    required this.description,
    required this.imageURL,
    required this.price,
    required this.category
  });
}

enum FoodCategory {
  maindishes,
  snacks,
  desserts,
  fastfoods,
  // drinks
}