import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../models/user_model.dart';
import '../../services/firebase_base.dart';
import '../widgets/food_card_square.dart';
import '../widgets/restaurant_card_visited.dart';
import '../widgets/review_widget.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseBaseClass firebaseBaseClass = FirebaseBaseClass();
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
      child: FutureBuilder(
        future: Future.wait([
          firebaseBaseClass.fetchUsers(),
          firebaseBaseClass.fetchFoods(),
          firebaseBaseClass.fetchRestaurants(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var users = snapshot.data[0];
            var foods = snapshot.data[1];
            var restaurants = snapshot.data[2];
            return Scaffold(
              appBar: buildAppBar(context, 'Home', users[0]),
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      visitedrestaurantsection(restaurants),
                      reviewSection('Reviews', users),
                      foodsectionsquare('Order Again', foods.pizzaList),
                      foodsectionsquare('Popular', foods.steakList),
                      foodsectionsquare('Recommended', foods.pastaList),
                      foodsectionsquare('You Might Like', foods.burgerList),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, String title, User user) {
    return AppBar(
      backgroundColor: Colors.transparent,
      brightness: Brightness.dark,
      centerTitle: true,
      title: Text(title),
      elevation: 0,
      actions: [
        FutureBuilder(
          future: firebaseBaseClass.downloadUserImageURL(user.imgUrl),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    return Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen(user: user)));
                  },
                  child: Hero(
                    tag: 'homeavatar${snapshot.data}',
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: snapshot.data,
                        memCacheHeight: 32,
                        memCacheWidth: 32,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }

  Widget visitedrestaurantsection(List restaurants) {
    return Container(
      height: 235,
      child: ListView.builder(
        itemCount: restaurants.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: Duration(milliseconds: 200),
            child: SlideAnimation(
              horizontalOffset: 50,
              child: FadeInAnimation(
                child: RestaurantCardVisited(
                  restaurant: restaurants[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget reviewSection(String title, List users) {
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
          child: AnimationLimiter(
            child: ListView.builder(
              itemCount: users.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              addAutomaticKeepAlives: true,
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
                        user: users[index],
                      ),
                    ),
                  ),
                );
              },
            ),
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
              return AnimationConfiguration.staggeredList(
                position: index,
                delay: Duration(milliseconds: 100),
                duration: Duration(milliseconds: 300),
                child: SlideAnimation(
                  horizontalOffset: 150,
                  child: FadeInAnimation(
                    child: FoodCardSquare(food: tempList[index]),
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
