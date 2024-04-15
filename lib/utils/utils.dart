import 'package:ct484_project/models/food.dart';
import 'package:intl/intl.dart';

String getCategoryName(FoodCategory category) {
  switch (category) {
    case FoodCategory.maindishes:
      return 'Bữa chính';
    case FoodCategory.snacks:
      return 'Ăn vặt';
    case FoodCategory.desserts:
      return 'Tráng miệng';
    case FoodCategory.fastfoods:
      return 'Thức ăn nhanh';
    default:
      return 'Unknown';
  }
}

String formatCurrency(double amount) {
  final formatter = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
  return formatter.format(amount);
}