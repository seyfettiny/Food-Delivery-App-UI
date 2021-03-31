import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomButton extends StatelessWidget {
  final String text;
  Color backgroundColor;
  bool isAnimated;
  VoidCallback onTap;
  CustomButton({
    @required this.text,
    this.isAnimated = true,
    this.backgroundColor = const Color(0xff161a1e),
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return isAnimated ? buildWithAnimation() : buildWithoutAnimation();
  }

  Widget buildWithoutAnimation() {
    return Container(
      height: 60,
      color: backgroundColor,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(8),
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
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget buildWithAnimation() {
    return AnimationConfiguration.synchronized(
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
    );
  }
}
