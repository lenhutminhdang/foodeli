import 'package:collection/collection.dart';
import 'package:ct484_project/models/cart_item.dart';
import 'package:ct484_project/models/food.dart';
import 'package:ct484_project/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // ######### Maindishes
    Food(
      name: 'Phở bò', 
      description: 'Một món súp hấp dẫn với bò thái mỏng, hỗn hợp gia vị, và nước dùng thơm ngon.', 
      imageURL: "lib/images/maindishes/pho-bo.jpg", 
      price: 45000, 
      category: FoodCategory.maindishes
    ),
    Food(
      name: 'Mỳ ý', 
      description: 'Mỳ Ý là một món ăn phổ biến trên khắp thế giới, được làm từ mỳ và sốt cà chua hoặc sốt kem.', 
      imageURL: "lib/images/maindishes/my-y.jpg", 
      price: 30000, 
      category: FoodCategory.maindishes
    ),
    Food(
      name: 'Tôm hấp', 
      description: 'Tôm tươi được hấp chín đến màu hồng, giữ nguyên hương vị tự nhiên và độ tươi ngon.', 
      imageURL: "lib/images/maindishes/hai-san-hap.jpg", 
      price: 200000, 
      category: FoodCategory.maindishes
    ),
    Food(
      name: 'Gà nướng rau củ', 
      description: 'Gà nướng với hỗn hợp gia vị, kèm theo rau củ tươi ngon, tạo thành một bữa ăn đầy đủ dinh dưỡng.', 
      imageURL: "lib/images/maindishes/ga-nuong-rau-cu.jpg", 
      price: 100000, 
      category: FoodCategory.maindishes
    ),
    Food(
      name: 'Cơm trộn', 
      description: 'Cơm trộn Hàn Quốc được chế biến từ cơm trắng, rau củ, thịt, và sốt Gochujang (sốt ớt Hàn Quốc), tạo nên một hương vị đậm đà và độc đáo.', 
      imageURL: "lib/images/maindishes/com-tron-han-quoc.jpg", 
      price: 40000, 
      category: FoodCategory.maindishes
    ),
    Food(
      name: 'Cơm đậu hủ xào', 
      description: 'Cơm trắng được kết hợp với rau củ tươi ngon và đậu hủ, tạo nên một món ăn chay bổ dưỡng và hấp dẫn.', 
      imageURL: "lib/images/maindishes/com-rau-xao-dau-hu.jpg", 
      price: 30000, 
      category: FoodCategory.maindishes
    ),
    Food(
      name: 'Beefsteak', 
      description: 'Một miếng thịt bò nướng chín vừa đủ, thường kèm theo sốt và các loại rau củ, tạo nên một món ăn thịnh soạn và hấp dẫn.', 
      imageURL: "lib/images/maindishes/beefsteak.jpg", 
      price: 120000, 
      category: FoodCategory.maindishes
    ),

    // ######### Fastfoods
    Food(
      name: 'Bánh mì', 
      description: 'Một ổ bánh mì giòn tan, kết hợp với nhân đậm đà như thịt, pate, rau sống và sốt, tạo nên một món ăn đầy đủ dinh dưỡng và hấp dẫn.', 
      imageURL: "lib/images/fastfoods/banh-mi.jpg", 
      price: 20000, 
      category: FoodCategory.fastfoods
    ),
    Food(
      name: 'Bánh xèo', 
      description: 'Một chiếc bánh xèo mỏng và giòn, đựng nhân thơm ngon từ thịt heo, tôm và rau sống, thường ăn kèm với nước mắm chua ngọt và rau sống.', 
      imageURL: "lib/images/fastfoods/banh-xeo.jpg", 
      price: 25000, 
      category: FoodCategory.fastfoods
    ),
    Food(
      name: 'Gà chiên', 
      description: 'Miếng gà chiên giòn, ngoài lớp vỏ vàng ruộm, bên trong mềm và thơm mùi gia vị, tạo nên một món ăn ngon miệng và hấp dẫn.', 
      imageURL: "lib/images/fastfoods/ga-chien.jpg", 
      price: 30000, 
      category: FoodCategory.fastfoods
    ),
    Food(
      name: 'Gỏi cuốn', 
      description: 'Gỏi cuốn là sự kết hợp hài hòa giữa rau sống, tôm, thịt, bún và bánh tráng, tạo ra một món ăn nhẹ nhàng, tươi mát và giàu dinh dưỡng.', 
      imageURL: "lib/images/fastfoods/goi-cuon.jpg", 
      price: 10000, 
      category: FoodCategory.fastfoods
    ),

    // ######### Snacks
    Food(
      name: 'Chocolate đen', 
      description: 'Viên sô cô la đậm đà và thơm ngon, tan chảy trong miệng, mang lại cảm giác hạnh phúc và thỏa mãn vị giác.', 
      imageURL: "lib/images/snacks/chocolate.jpg", 
      price: 25000, 
      category: FoodCategory.snacks
    ),
    Food(
      name: 'Khoai tây chiên', 
      description: 'Khoai tây chiên giòn rụm bên ngoài, mềm thơm bên trong, được ướp gia vị và ăn kèm với sốt mayo, tạo nên một món ăn ngon miệng và hấp dẫn.', 
      imageURL: "lib/images/snacks/khoai-tay-chien.jpg", 
      price: 20000, 
      category: FoodCategory.snacks
    ),
    Food(
      name: 'Hạt dinh dưỡng', 
      description: 'Hạt dinh dưỡng là sự kết hợp hài hòa giữa hạt hạnh nhân, hạt hạnh nhân, hạt bí, hạt bí ngô và các loại hạt khác, mang lại hương vị đa dạng và giàu dinh dưỡng.', 
      imageURL: "lib/images/snacks/hat.jpg", 
      price: 35000, 
      category: FoodCategory.snacks
    ),

    // ######### Drinks
    // Food(
    //   name: 'Cà phê đen', 
    //   description: 'Cà phê đen đậm đà, thơm ngon, và sôi động, mang lại cảm giác tỉnh táo và sảng khoái vào mỗi sáng.', 
    //   imageURL: "lib/images/drinks/cafe.jpg", 
    //   price: 20000, 
    //   category: FoodCategory.drinks
    // ),
    // Food(
    //   name: 'Sữa lắc', 
    //   description: 'Sữa lắc mềm mịn và ngọt ngào, kết hợp với hương vị sữa và các loại hương vị như chocolate, vani, hoặc dâu, làm dịu dàng và thỏa mãn vị giác.', 
    //   imageURL: "lib/images/drinks/milkshake.jpg", 
    //   price: 25000, 
    //   category: FoodCategory.drinks
    // ),

    // ######### Desserts
    Food(
      name: 'Bánh kem mini', 
      description: 'Bánh kem tinh tế và đẹp mắt, với lớp kem mousse mịn và những lớp bánh mềm mịn, mang lại cảm giác lạ mắt và thưởng thức ngon miệng.', 
      imageURL: "lib/images/desserts/banh-kem.jpg", 
      price: 40000, 
      category: FoodCategory.desserts
    ),
    Food(
      name: 'Kem tươi', 
      description: 'Kem lạnh mát, ngọt ngào và đa dạng với nhiều loại hương vị, là món tráng miệng hoàn hảo để làm dịu cơn khát và kích thích vị giác.', 
      imageURL: "lib/images/desserts/kem.jpg", 
      price: 15000, 
      category: FoodCategory.desserts
    ),
  ];

  // GETTERS
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  
  // OPERATIONS
  // user cart
  final List<CartItem> _cart = [];
  // add to cart
  void addToCart(Food food) {
    // check food exist or not
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      return item.food == food;
    });

    // if the food existed in Cart => increase cartItem quantity
    if(cartItem != null) {
      ++cartItem.quantity;
    }
    // else => add new food to Cart
    else {
      _cart.add(
        CartItem(food: food)
      );
    }

    notifyListeners();
  }

  // remove food from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    // food exist in cart
    if(cartIndex != -1) {
      // if cart item quantity > 1 => decrease quantity by 1
      if(_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      }
      // if cart item quantity = 1 => remove cart item from cart
      else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  // get total price
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      total += cartItem.food.price * cartItem.quantity;
    }
    return total;
  }

  // get total number of items in cart
  int getNumberOfItem() {
    int count = 0;
    for (CartItem cartItem in _cart) {
      count += cartItem.quantity;
    }
    return count;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // HELPERS
  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    String formattedDate = DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());

    receipt.writeln('@FOODELI');
    receipt.writeln();

    int index = 1;
    for (final cartItem in _cart) {
      receipt.writeln("$index. ${cartItem.food.name} - ${formatCurrency(cartItem.food.price)} x ${cartItem.quantity}");
      index++;
    }

    receipt.writeln();
    receipt.writeln("+ Ngày mua: $formattedDate");
    receipt.writeln("+ Số lượng: ${getNumberOfItem()}");
    receipt.writeln("+ Tổng tiền: ${formatCurrency(getTotalPrice())}");

    return receipt.toString();
  }
}