import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery_app/models/food_model.dart';
import 'package:food_delivery_app/services/firebase_base.dart';
import 'package:shimmer/shimmer.dart';

class FoodCardSquare extends StatelessWidget {
  final firebaseBaseClass = FirebaseBaseClass();

  final FoodElement food;
  FoodCardSquare({
    @required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 120,
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
                blurRadius: 10)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: firebaseBaseClass.downloadFoodImageURL(food.imgUrl),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: snapshot.data,
                        fit: BoxFit.cover,
                        height: 140,
                      ),
                    );
                  } else {
                    return Container(
                      height: 140,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.amber,
                        child: Container(),
                      ),
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  food.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
