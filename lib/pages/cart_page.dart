import 'package:flutter/material.dart'; //c
import 'package:provider/provider.dart';
import 'package:test02/models/drink.dart';
import 'package:test02/models/shop.dart';
import 'package:test02/components/drink_tile.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove drink from cart
  void removeFromCart(Drink drink) {
    Provider.of<BubbleTeaShop>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
        //heading
        const Text(
          'Your Cart',
          style: TextStyle(fontSize: 20),
        ),

          const SizedBox(height: 20),

          //list of cart items
          Expanded(
            child: ListView.builder(
              itemCount: value.cart.length,
              itemBuilder: (context, index) {
                //get individual drink from cart
                Drink drink = value.cart[index];

              //return as a nice title
              return DrinkTile(
                drink: drink,
                onTap: () => removeFromCart(drink),
                trailing: Icon(Icons.delete),
              );
            },
          ),
        ),
          //pay button
            MaterialButton(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Pay',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.brown,
              onPressed: () {
                // Remove all drinks from the cart
                while (value.cart.isNotEmpty) {
                  removeFromCart(value.cart.first);
                }

                // Show an AlertDialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Payment successful!'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ),
    );
  }
}
