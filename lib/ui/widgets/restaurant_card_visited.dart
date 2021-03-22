import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery_app/models/restaurant_model.dart';
import 'package:food_delivery_app/services/firebase_base.dart';

class RestaurantCardVisited extends StatelessWidget {
  final firebaseBaseClass = FirebaseBaseClass();
  final Restaurant restaurant;

  RestaurantCardVisited({
    @required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [Color(0xff181a1b), Color(0xff363b40)]),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(5, 10),
                blurRadius: 10,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: firebaseBaseClass
                    .downloadRestaurantImageURL(restaurant.imgUrl),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: snapshot.data,
                        fit: BoxFit.fitWidth,
                        width: 300,
                        height: 155,
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  restaurant.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: 15,
                  child: ListView.builder(
                    itemCount: restaurant.restaurantType.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Text(
                        restaurant.restaurantType[index] + '  ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
