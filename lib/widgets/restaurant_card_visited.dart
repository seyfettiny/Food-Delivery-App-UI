import 'package:flutter/material.dart';

class RestaurantCardVisited extends StatelessWidget {
  final String imgUrl;
  final String title;
  const RestaurantCardVisited({Key key, this.imgUrl, this.title})
      : super(key: key);

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
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/restaurant/Ciqxn7FE4vE.jpg',
                  fit: BoxFit.fitWidth,
                  width: 300,
                  height: 155,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Restaurant Name',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                //TODO: restaurantmodel.rtype(index)
                child: Text(
                  'Fine Dinner  •  Family ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
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
