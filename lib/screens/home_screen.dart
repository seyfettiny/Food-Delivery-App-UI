import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:food_delivery_app/models/restaurant_model.dart';
import 'package:food_delivery_app/models/user_model.dart';
import 'package:food_delivery_app/screens/food_detail_screen.dart';
import 'package:food_delivery_app/screens/menu_screen.dart';
import 'package:food_delivery_app/screens/profile_screen.dart';
import 'package:food_delivery_app/widgets/food_card_square.dart';
import 'package:food_delivery_app/widgets/restaurant_card_visited.dart';
import 'package:food_delivery_app/widgets/review_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          stops: [0.0, 1.0],
          colors: [
            Color(0xff161a1e),
            Color(0xff25292d),
          ],
        ),
      ),
      child: Scaffold(
        appBar: buildAppBar(context, 'Home'),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                visitedrestaurantsection(),
                reviewSection('Reviews'),
                foodsectionsquare('Order Again', pizzaList),
                foodsectionsquare('Popular', steakList),
                foodsectionsquare('Recommended', soupList),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: Colors.transparent,
      brightness: Brightness.dark,
      centerTitle: true,
      title: Text(title),
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {
              return Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileScreen(user: userList[8])));
            },
            child: Hero(
              tag: 'avatar',
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: userList[8].imgUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget visitedrestaurantsection() {
    return Container(
      height: 235,
      child: ListView.builder(
        itemCount: restaurantList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MenuScreen(restaurant: restaurantList[index])));
            },
            child: AnimationConfiguration.staggeredList(
              position: index,
              delay: Duration(milliseconds: 100),
              duration: Duration(milliseconds: 300),
              child: SlideAnimation(
                horizontalOffset: 50,
                child: FadeInAnimation(
                  child: RestaurantCardVisited(
                    restaurant: restaurantList[index],
                  ),
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
          height: 150,
          child: ListView.builder(
            itemCount: 8,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
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

  Widget foodsectionsquare(String title, List tempList) {
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
            itemCount: tempList.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoodDetailScreen(
                                food: tempList[index],
                              )));
                },
                child: AnimationConfiguration.staggeredList(
                  position: index,
                  delay: Duration(milliseconds: 100),
                  duration: Duration(milliseconds: 300),
                  child: SlideAnimation(
                    horizontalOffset: 150,
                    child: FadeInAnimation(
                      child: FoodCardSquare(food: tempList[index]),
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
