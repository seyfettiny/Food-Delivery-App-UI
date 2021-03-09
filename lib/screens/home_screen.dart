import 'package:flutter/material.dart';
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
            reviewSection("Reviews"),
            foodsectionsquare("Order Again"),
            foodsectionsquare("Popular"),
            foodsectionsquare("Recommended"),
          ],
        ),
      ),
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
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: FoodCardSquare(),
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
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          height: 100,
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ReviewWidget(index: index);
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
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
            onTap: () {},
            child: RestaurantCardVisited(),
          );
        },
      ),
    );
  }
}
