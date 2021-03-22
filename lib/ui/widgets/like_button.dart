import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:lottie/lottie.dart';

class LikeButton extends StatefulWidget {
  final double size;
  final FoodElement food;
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
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    tapFav();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void tapFav() {
    setState(() {
      widget.food.isFav
          ? {animationController.reverse(), widget.food.isFav = false}
          : {animationController.forward(), widget.food.isFav = true};
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapFav,
      child: Lottie.asset(
        'assets/lottie/lf30_editor_1dljolly.json',
        alignment: Alignment.center,
        width: widget.size * 2,
        height: widget.size * 2,
        fit: BoxFit.fill,
        controller: animationController,
      ),
    );
  }
}
// IconButton(
//             padding: EdgeInsets.zero,
//             splashRadius: 1,
//             icon: FaIcon(
//               widget.food.isFav
//                   ? FontAwesomeIcons.solidHeart
//                   : FontAwesomeIcons.heart,
//               color: widget.food.isFav ? Colors.red : Colors.white,
//               size: animation.value,
//             ),
//             onPressed: () {
//               setState(() {
//                 widget.food.isFav
//                     ? animationController.reverse()
//                     : animationController.forward();
//               });
//               print('onPressed ' + animation.toStringDetails());
//             },
//           ),
