import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/models/food_model.dart';

class LikeButton extends StatefulWidget {
  final double size;
  final Food food;
  LikeButton({Key key, @required this.size, this.food}) : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    animation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: widget.size, end: (widget.size + 5)),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: (widget.size + 5), end: widget.size),
        weight: 50,
      ),
    ]).animate(animationController);

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          widget.food.isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          widget.food.isFav = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return SizedBox(
          width: 30,
          height: 30,
          child: IconButton(
            padding: EdgeInsets.zero,
            splashRadius: 1,
            icon: FaIcon(
              widget.food.isFav
                  ? FontAwesomeIcons.solidHeart
                  : FontAwesomeIcons.heart,
              color: widget.food.isFav ? Colors.red : Colors.white,
              size: animation.value,
            ),
            onPressed: () {
              setState(() {
                widget.food.isFav
                    ? animationController.reverse()
                    : animationController.forward();
              });
              print('onPressed ' + animation.toStringDetails());
            },
          ),
        );
      },
    );
  }
}
