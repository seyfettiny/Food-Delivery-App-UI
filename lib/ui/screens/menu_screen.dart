import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/models/restaurant_model.dart';
import 'package:food_delivery_app/ui/widgets/custom_button.dart';
import 'package:food_delivery_app/ui/widgets/food_container.dart';

import 'cart_screen.dart';

class MenuScreen extends StatelessWidget {
  final Restaurant restaurant;
  MenuScreen({
    @required this.restaurant,
  });
  Map<String, List> section1;
  Map<String, List> section2;
  Map<String, List> section3;
  Map<String, List> section4;
  @override
  Widget build(BuildContext context) {
    section1 = {
      'First Meal': restaurant.foodSection.firstMeal.soupList,
      'Hot Meals': restaurant.foodSection.hotMeals.steakList,
      'Pizza': restaurant.foodSection.pizza.pizzaList,
    };
    section2 = {
      'Ale': restaurant.beerSection.ale.aleBeerList,
      'Lager': restaurant.beerSection.lager.lagerBeerList,
      'Wheat Beer': restaurant.beerSection.wheatBeer.wheatBeerList,
    };
    section3 = {
      'Red': restaurant.wineSection.red.redWineList,
      'White': restaurant.wineSection.white.whiteWineList,
      'Sparkling': restaurant.wineSection.sparkling.sparklingWineList,
    };
    section4 = {
      'Tea': restaurant.hotDrinkSection.tea.teaList,
      'Drip Coffee': restaurant.hotDrinkSection.dripCoffee.dripCoffeeList,
      'Espresso': restaurant.hotDrinkSection.espresso.espressoList,
    };
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
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: buildAppBar(context),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBarView(
                children: [
                  buildTabFood(section1),
                  buildTabFood(section2),
                  buildTabFood(section3),
                  buildTabFood(section4),
                ],
              ),
            ),
            bottomNavigationBar: CustomButton(
              text: 'Checkout Order',
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTabFood(Map section) {
    return Container(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSectionTitle(section.keys.elementAt(index)),
                FoodContainer(foodList: section.values.elementAt(index)),
              ],
            ),
          );
        },
      ),
    );
  }

  Padding buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      brightness: Brightness.dark,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
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
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TabBar(
            isScrollable: true,
            indicatorColor: Colors.deepOrange,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                child: Text(
                  'Food',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Beer',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Wine',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Hot drinks',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
