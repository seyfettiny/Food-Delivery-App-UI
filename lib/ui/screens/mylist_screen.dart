import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_delivery_app/models/user_model.dart';
import 'package:food_delivery_app/services/firebase_base.dart';
import 'package:food_delivery_app/ui/screens/profile_screen.dart';
import 'package:food_delivery_app/ui/widgets/restaurant_card.dart';
import 'package:food_delivery_app/ui/widgets/restaurant_card_visited.dart';

class MyListScreen extends StatelessWidget {
  final firebaseBaseClass = FirebaseBaseClass();
  MyListScreen({Key key}) : super(key: key);

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
          firebaseBaseClass.fetchRestaurants(),
        ]),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var users = snapshot.data[0];
            List restaurants = snapshot.data[1];
            restaurants.shuffle();
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: buildAppBar(context, 'My List', users[0]),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      visitedrestaurantsection('Visited', restaurants),
                      restaurantsection('Recent', restaurants),
                      restaurantsection('Favorite', restaurants),
                      restaurantsection('Want to Visit', restaurants),
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
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
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
                    tag: 'avatar',
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: snapshot.data,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }

  Widget restaurantsection(String title, List restaurants) {
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
            itemCount: restaurants.length,
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
                      child: RestaurantCard(
                        restaurant: restaurants[index],
                      ),
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

  Widget visitedrestaurantsection(String title, List restaurants) {
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
            itemCount: restaurants.length,
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
                      child: RestaurantCardVisited(
                        restaurant: restaurants[index],
                      ),
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
