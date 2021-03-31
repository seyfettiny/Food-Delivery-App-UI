import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant_model.dart';
import 'package:food_delivery_app/services/firebase_base.dart';
import 'package:food_delivery_app/ui/screens/menu_screen.dart';
import 'package:food_delivery_app/ui/widgets/custom_button.dart';
import 'package:food_delivery_app/ui/widgets/food_card_square.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  final FirebaseBaseClass firebaseBaseClass = FirebaseBaseClass();
  RestaurantScreen({Key key, this.restaurant}) : super(key: key);

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
        future: firebaseBaseClass.downloadRestaurantImageURL(restaurant.imgUrl),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                brightness: Brightness.dark,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              offset: Offset(15, 10),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: snapshot.data,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        restaurant.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      Container(
                        height: 20,
                        child: ListView.builder(
                          itemCount: restaurant.restaurantType.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              Text(restaurant.restaurantType[index] + '    '),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: CustomButton(
                              text: 'Table',
                              isAnimated: false,
                              backgroundColor: Colors.transparent,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return buildAlertDialog(context);
                                  },
                                );
                              },
                            ),
                          ),
                          Flexible(
                            child: CustomButton(
                              text: 'Food & Drink',
                              isAnimated: false,
                              backgroundColor: Colors.transparent,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MenuScreen(restaurant: restaurant),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Featured',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              restaurant.foodSection.pizza.pizzaList.length,
                          itemBuilder: (context, index) {
                            var list = restaurant.foodSection.pizza.pizzaList;
                            return FoodCardSquare(food: list[index]);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Story',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(restaurant.description + restaurant.description),
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

  Widget buildAlertDialog(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(20),
      contentPadding: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text('Book Table'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildSwitch(),
          SingleChildScrollView(
            child: Row(
              children: [
                Text('How many people?  '),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '1',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ClipOval(
                        child: Material(
                          color: Theme.of(context).accentColor,
                          child: InkWell(
                            onTap: () {},
                            child: SizedBox(
                                width: 40, height: 40, child: Icon(Icons.add)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ClipOval(
                  child: Material(
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                          width: 40, height: 40, child: Icon(Icons.remove)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text('Available Time'),
          Wrap(
            spacing: 6,
            runSpacing: -5,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black45),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text('4:30 PM'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black45),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text('5:00 PM'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black45),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text('5:30 PM'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black45),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text('6:00 PM'),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(text: 'Reservation ', children: [
              TextSpan(
                text: 'Today May 2',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Row buildSwitch() {
    return Row(
      children: [
        Text('Terrace  '),
        Switch(activeColor: Colors.grey, value: true, onChanged: (value) {}),
        Text('  Inside'),
      ],
    );
  }
}
