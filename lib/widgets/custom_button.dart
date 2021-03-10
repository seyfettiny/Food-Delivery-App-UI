import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AnimationConfiguration.synchronized(
        child: SlideAnimation(
          delay: Duration(milliseconds: 400),
          duration: Duration(milliseconds: 400),
          verticalOffset: 150,
          child: Container(
            height: 60,
            color: Color(0xff161a1e),
            child: Expanded(
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
                  'Checkout Order',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
