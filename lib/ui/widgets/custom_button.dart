import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_delivery_app/models/food_model.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final FoodElement food;
  CustomButton({
    @required this.text,
    this.food,
  });
  CustomButton.addToCart({@required this.food, @required this.text});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Check if cart item exists ? increase amount : add new item to the list

        // if (cartItems.contains(food)) {
        //   print(true.toString());
        // } else {
        //   cartItems.add(Cart(food: food, amount: 1));
        // }
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
