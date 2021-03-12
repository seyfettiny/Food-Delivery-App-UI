import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_delivery_app/screens/menu_screen.dart';
import 'package:food_delivery_app/widgets/food_card_square.dart';
import 'package:food_delivery_app/widgets/restaurant_card_visited.dart';
import 'package:food_delivery_app/widgets/review_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            visitedrestaurantsection(),
            reviewSection('Reviews'),
            foodsectionsquare('Order Again'),
            foodsectionsquare('Popular'),
            foodsectionsquare('Recommended'),
          ],
        ),
      ),
    );
  }

  Widget visitedrestaurantsection() {
    return Container(
      height: 235,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MenuScreen()));
            },
            child: AnimationConfiguration.staggeredList(
              position: index,
              delay: Duration(milliseconds: 100),
              duration: Duration(milliseconds: 300),
              child: SlideAnimation(
                horizontalOffset: 50,
                child: FadeInAnimation(
                  child: RestaurantCardVisited(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget reviewSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          height: 100,
          child: ListView.builder(
            itemCount: 8,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: AnimationConfiguration.staggeredList(
                  position: index,
                  delay: Duration(milliseconds: 100),
                  duration: Duration(milliseconds: 300),
                  child: SlideAnimation(
                    horizontalOffset: 100,
                    child: FadeInAnimation(
                      child: ReviewWidget(
                        index: index,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget foodsectionsquare(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            itemCount: 8,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: AnimationConfiguration.staggeredList(
                  position: index,
                  delay: Duration(milliseconds: 100),
                  duration: Duration(milliseconds: 300),
                  child: SlideAnimation(
                    horizontalOffset: 150,
                    child: FadeInAnimation(
                      child: FoodCardSquare(),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
