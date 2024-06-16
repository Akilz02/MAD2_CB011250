import 'package:flutter/cupertino.dart';

import 'drink.dart';

class BubbleTeaShop extends ChangeNotifier {
  //list of drinks for sale
  final List<Drink> _shop = [
    //pearl milk tea
    Drink(
      name: "Pearl Milk Tea",
      price: "4.50",
      imagePath: "lib/images/bubble-milk-tea-pearl-milk-tea-png.webp",
    ),
//taro milk tea
    Drink(
      name: "Taro Milk Tea",
      price: "6.50",
      imagePath: "lib/images/Milkteas-400x400_0007_FZT_MilkTea_Taro_Tapioca.png",
    ),
//matcha milk tea
    Drink(
      name: "Matcha Milk Tea",
      price: "5.00",
      imagePath: "lib/images/bubble-milk-tea-pearl-milk-tea-png.webp",
    ),
//strawberry milk tea
    Drink(
      name: "Strawberry Milk Tea",
      price: "5.50",
      imagePath: "lib/images/bubble-milk-tea-pearl-milk-tea-png.webp",
    ),
//lychee milk tea
    Drink(
      name: "Lychee Milk Tea",
      price: "6.00",
      imagePath: "lib/images/204304577-a-glass-of-bubble-tea-with-a-pink-straw-generative-ai-image.jpg",
    ),
//caramel milk tea
    Drink(
      name: "Caramel Milk Tea",
      price: "4.50",
      imagePath: "lib/images/bubble-milk-tea-pearl-milk-tea-png.webp",
    ),
//coffee milk tea
    Drink(
      name: "Coffee Milk Tea",
      price: "4.50",
      imagePath: "lib/images/Boba-PNG-Picture.png",
    ),
//chocolate milk tea
    Drink(
      name: "Chocolate Milk Tea",
      price: "4.50",
      imagePath: "lib/images/48-482627_bringing-tea-to-life-transparent-milk-tea-png.png",
    ),
  ];

  //list of drinks in user cart
  final List<Drink> _userCart = [];

  //get drinks for sale
  List<Drink> get shop => _shop;

  //get user cart
  List<Drink> get cart => _userCart;

  //add drinks to cart
  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  //remove drinks from cart
  void removeFromCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
