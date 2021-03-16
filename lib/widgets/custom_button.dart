import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/food_model.dart';

class CustomButton extends StatelessWidget {
  final String text;
  Food food;
  CustomButton({
    Key key,
    @required this.text,
  }) : super(key: key);
  CustomButton.addToCart({@required this.food, @required this.text});
  Random random = Random();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //added indicator
        if (cartItems.contains(food)) {
          print(true.toString());
        } else {
          cartItems.add(Cart(id: random.nextInt(1000), food: food, amount: 1));
        }
      },
      child: AnimationConfiguration.synchronized(
        child: SlideAnimation(
          delay: Duration(milliseconds: 400),
          duration: Duration(milliseconds: 400),
          verticalOffset: 150,
          child: Container(
            height: 60,
            color: Color(0xff161a1e),
            child: Container(
              margin: EdgeInsets.all(8),
              //width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  stops: [0.0, 1.0],
                  colors: [
                    Color(0xffe92411),
                    Color(0xfffa551d),
                  ],
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
