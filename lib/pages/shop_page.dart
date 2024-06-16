import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test02/components/drink_tile.dart';
import 'package:test02/models/drink.dart';
import 'package:test02/models/shop.dart';

import 'order_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //user selected a drink, go to order page
  void goToOrderPage(Drink drink) {
    //navigate to order page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderPage(
          drink: drink,
        ),
      ),
    );
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
              Text(
                "Order Your Favourite Bubble Tea",
                style: TextStyle(fontSize: 20),
              ),

              //spacing for the card
              SizedBox(height: 30),

              //List of drinks for sale
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(5.0),
                    itemCount: value.shop.length,
                    itemBuilder: (context, index) {
                      //get individual drink from shop
                      Drink individualDrink = value.shop[index];

                      //return that drink as a nice title
                      return DrinkTile(
                        drink: individualDrink,
                        onTap: () => goToOrderPage(individualDrink),
                        trailing: Icon(Icons.arrow_forward),
                      );
                    }
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
