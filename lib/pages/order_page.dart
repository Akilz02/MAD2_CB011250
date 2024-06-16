import 'package:flutter/material.dart';
import 'package:test02/models/drink.dart';
import 'package:test02/models/shop.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({
    super.key,
    required this.drink,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
//customize sweetness
  double sweetValue = 0.5;

  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  //customize ice
  double iceValue = 0.5;

  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  //customize pearls
  double pearlValue = 0.5;

  void customizePearl(double newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

  //add to cart
  void addToCart() {
    //firstly, add to cart
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);

    //direct user back to shop page
    Navigator.pop(context);

    //let user know drink has been added to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Successfully Added to Cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.drink.name)),
      backgroundColor: Colors.brown[200],
      body: Column(
        children: [
          SizedBox(height: 30),
          //drink image
          Image.asset(widget.drink.imagePath, height: 200, width: 200),

          //sliders to customize drink
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                //Description
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 350,
                      child: Text('Indulge in the unique and exotic flavor of taro with our signature Taro Bubble Tea. Made from real taro root,'
                          ' this creamy concoction offers a delightful blend of sweet and earthy notes, '
                          'complemented by chewy tapioca pearls for an extra burst of fun with every sip.'),
                    ),
                  ],
                ),
                //sweet slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text('Sweet'),
                    ),
                    Expanded(
                      child: Slider(
                        value: sweetValue,
                        label: sweetValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeSweet(value),
                      ),
                    )
                  ],
                ),

                //ice slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text('Ice'),
                    ),
                    Expanded(
                      child: Slider(
                        value: iceValue,
                        label: iceValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeIce(value),
                      ),
                    )
                  ],
                ),

                //pearls slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text('Pearls'),
                    ),
                    Expanded(
                      child: Slider(
                        value: pearlValue,
                        label: pearlValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizePearl(value),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          //add to cart button
          MaterialButton(
            child: Text(
              "Add to Cart",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.brown,
            onPressed: addToCart,
          )
        ],
      ),
    );
  }
}
