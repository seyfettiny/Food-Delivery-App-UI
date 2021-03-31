import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../models/food_model.dart';
import '../../models/restaurant_model.dart';
import '../../services/firebase_base.dart';
import 'cart_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/food_container.dart';
import '../widgets/like_button.dart';

class FoodDetailScreen extends StatelessWidget {
  final FoodElement food;
  final Restaurant restaurant;
  FoodDetailScreen({
    Key key,
    this.food,
    this.restaurant,
  }) : super(key: key);
  final firebaseBaseClass = FirebaseBaseClass();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(context),
          bottomNavigationBar: CustomButton(text: 'Add to Order'),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: Future.wait([
                    firebaseBaseClass.downloadFoodImageURL(food.imgUrl),
                    firebaseBaseClass.fetchFoods(),
                  ]),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var foodImageUrl = snapshot.data[0];
                      var foodList = snapshot.data[1];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 280,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LikeButton(
                                        size: 25,
                                        food: food,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text('Gluten free'),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0),
                                              child: Text(
                                                food.name,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0),
                                              child: Text(
                                                '€ ${food.price}',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 8, 12, 8),
                                                child: Icon(
                                                    FontAwesomeIcons.clock),
                                              ),
                                              Text(
                                                food.serveTime,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 8, 12, 8),
                                                child: Icon(
                                                    FontAwesomeIcons.gripfire),
                                              ),
                                              Text(
                                                '${food.calories} calories',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 8, 12, 8),
                                                child: Icon(FontAwesomeIcons
                                                    .weightHanging),
                                              ),
                                              Text(
                                                food.weight,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: -15,
                                  bottom: -10,
                                  child: Container(
                                    width: 260,
                                    height: 260,
                                    child: ImageFiltered(
                                      imageFilter: ImageFilter.blur(
                                          sigmaX: 30, sigmaY: 30),
                                      child: CachedNetworkImage(
                                        imageUrl: foodImageUrl,
                                        memCacheHeight: 260,
                                        memCacheWidth: 260,
                                        color: Colors.black.withOpacity(0.3),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: -20,
                                  bottom: 0,
                                  child: Container(
                                    width: 230,
                                    height: 230,
                                    child: CachedNetworkImage(
                                      imageUrl: foodImageUrl,
                                      maxHeightDiskCache: 230,
                                      maxWidthDiskCache: 230,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 24),
                            child: Text(
                              food.description,
                              style: TextStyle(fontSize: 14, height: 1.3),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'With this order',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          FoodContainer(foodList: foodList.burgerList),
                          FoodContainer(foodList: foodList.redWineList),
                        ],
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      brightness: Brightness.dark,
      centerTitle: true,
      actions: [
        IconButton(
          icon: FaIcon(FontAwesomeIcons.shoppingBag),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartScreen()));
          },
        ),
      ],
      title: Text(
        'Menu',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
