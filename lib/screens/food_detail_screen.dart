import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'package:food_delivery_app/widgets/custom_button.dart';
import 'package:food_delivery_app/widgets/like_button.dart';
import 'package:food_delivery_app/widgets/food_container.dart';

class FoodDetailScreen extends StatelessWidget {
  final Food food;
  const FoodDetailScreen({
    Key key,
    this.food,
  }) : super(key: key);

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
          appBar: buildAppBar(),
          bottomNavigationBar: CustomButton(text: 'Add to Order'),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LikeButton(
                                size: 30,
                                food: food,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('Gluten free'),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      child: Text(
                                        food.name,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      child: Text(
                                        '€ ${food.price}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 12, 8),
                                        child: Icon(FontAwesomeIcons.clock),
                                      ),
                                      Text(
                                        food.serveTime,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 12, 8),
                                        child: Icon(FontAwesomeIcons.gripfire),
                                      ),
                                      Text(
                                        '${food.calories} calories',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8, 12, 8),
                                        child: Icon(
                                            FontAwesomeIcons.weightHanging),
                                      ),
                                      Text(
                                        food.weight,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: -50,
                          bottom: -10,
                          child: Hero(
                            tag: '${food.imgUrl}',
                            child: Container(
                              decoration: BoxDecoration(
                                //TODO: use BackDropFilter as shadow, shaped as png
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    offset: Offset(-10, 15),
                                    blurRadius: 15,
                                  )
                                ],
                              ),
                              child: Image.asset(
                                food.imgUrl,
                                width: 250,
                                height: 250,
                              ),
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
                  FoodContainer(foodList: pizzaList),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
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
          onPressed: () {},
        ),
      ],
      title: Text(
        'Menu',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
