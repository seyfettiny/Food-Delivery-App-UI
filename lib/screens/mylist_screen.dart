import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_delivery_app/widgets/restaurant_card.dart';
import 'package:food_delivery_app/widgets/restaurant_card_visited.dart';

class MyListScreen extends StatelessWidget {
  const MyListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            visitedrestaurantsection('Visited'),
            restaurantsection('Recent'),
            restaurantsection('Favorite'),
            restaurantsection('Want to Visit'),
          ],
        ),
      ),
    );
  }

  Widget restaurantsection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
          height: 220,
          child: ListView.builder(
            itemCount: 4,
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
                      child: RestaurantCard(),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget visitedrestaurantsection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
          height: 235,
          child: ListView.builder(
            itemCount: 4,
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
                    horizontalOffset: 50,
                    child: FadeInAnimation(
                      child: RestaurantCardVisited(),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
