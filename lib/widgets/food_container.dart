import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_delivery_app/screens/food_detail_screen.dart';
import 'package:food_delivery_app/widgets/like_button.dart';

class FoodContainer extends StatelessWidget {
  const FoodContainer({
    Key key,
    @required this.foodList,
  }) : super(key: key);

  final List foodList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: foodList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodDetailScreen(
                            food: foodList[index],
                          )));
            },
            child: AnimationConfiguration.staggeredList(
              position: index,
              delay: Duration(milliseconds: 100),
              duration: Duration(milliseconds: 300),
              child: SlideAnimation(
                horizontalOffset: 100,
                child: FadeInAnimation(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 230,
                        width: 140,
                        margin: EdgeInsets.symmetric(horizontal: 14),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xff33343b),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(15, 10),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LikeButton(
                              size: 14,
                              food: foodList[index],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: foodList[index].name,
                                  child: Text(
                                    foodList[index].name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Text(
                                  '€ ${foodList[index].price}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  foodList[index].description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 11),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        //TODO: animatedbuilder rotation
                        top: 30,
                        right: 0,
                        child: Hero(
                          tag: foodList[index].imgUrl,
                          child: ImageFiltered(
                            imageFilter:
                                ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Image.asset(
                              foodList[index].imgUrl,
                              width: 130,
                              height: 130,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: -10,
                        child: Image.asset(
                          foodList[index].imgUrl,
                          width: 130,
                          height: 130,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
