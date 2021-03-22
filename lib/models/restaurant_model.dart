// To parse this JSON data, do
//
//     final restaurant = restaurantFromJson(jsonString);

import 'dart:convert';

import 'package:food_delivery_app/models/food_model.dart';

List<Restaurant> restaurantFromJson(String str) =>
    List<Restaurant>.from(json.decode(str).map((x) => Restaurant.fromJson(x)));

String restaurantToJson(List<Restaurant> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Restaurant {
  Restaurant({
    this.imgUrl,
    this.description,
    this.title,
    this.restaurantType,
    this.beerSection,
    this.foodSection,
    this.hotDrinkSection,
    this.wineSection,
  });

  String imgUrl;
  String description;
  String title;
  List<String> restaurantType;
  BeerSection beerSection;
  FoodSection foodSection;
  HotDrinkSection hotDrinkSection;
  WineSection wineSection;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        imgUrl: json['imgUrl'],
        description: json['description'],
        title: json['title'],
        restaurantType: List<String>.from(json['restaurantType'].map((x) => x)),
        beerSection: BeerSection.fromJson(json['beerSection']),
        foodSection: FoodSection.fromJson(json['foodSection']),
        hotDrinkSection: HotDrinkSection.fromJson(json['hotDrinkSection']),
        wineSection: WineSection.fromJson(json['wineSection']),
      );

  Map<String, dynamic> toJson() => {
        'imgUrl': imgUrl,
        'description': description,
        'title': title,
        'restaurantType': List<dynamic>.from(restaurantType.map((x) => x)),
        'beerSection': beerSection.toJson(),
        'foodSection': foodSection.toJson(),
        'hotDrinkSection': hotDrinkSection.toJson(),
        'wineSection': wineSection.toJson(),
      };
}

class BeerSection {
  BeerSection({
    this.ale,
    this.lager,
    this.wheatBeer,
  });

  Ale ale;
  Lager lager;
  WheatBeer wheatBeer;

  factory BeerSection.fromJson(Map<String, dynamic> json) => BeerSection(
        ale: Ale.fromJson(json['Ale']),
        lager: Lager.fromJson(json['Lager']),
        wheatBeer: WheatBeer.fromJson(json['Wheat Beer']),
      );

  Map<String, dynamic> toJson() => {
        'Ale': ale.toJson(),
        'Lager': lager.toJson(),
        'Wheat Beer': wheatBeer.toJson(),
      };
}

class Ale {
  Ale({
    this.aleBeerList,
  });

  List<FoodElement> aleBeerList;

  factory Ale.fromJson(Map<String, dynamic> json) => Ale(
        aleBeerList: List<FoodElement>.from(
            json['aleBeerList'].map((x) => FoodElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'aleBeerList': List<dynamic>.from(aleBeerList.map((x) => x.toJson())),
      };
}

class Lager {
  Lager({
    this.lagerBeerList,
  });

  List<FoodElement> lagerBeerList;

  factory Lager.fromJson(Map<String, dynamic> json) => Lager(
        lagerBeerList: List<FoodElement>.from(
            json['lagerBeerList'].map((x) => FoodElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'lagerBeerList':
            List<dynamic>.from(lagerBeerList.map((x) => x.toJson())),
      };
}

class WheatBeer {
  WheatBeer({
    this.wheatBeerList,
  });

  List<FoodElement> wheatBeerList;

  factory WheatBeer.fromJson(Map<String, dynamic> json) => WheatBeer(
        wheatBeerList: List<FoodElement>.from(
            json['wheatBeerList'].map((x) => FoodElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'wheatBeerList':
            List<dynamic>.from(wheatBeerList.map((x) => x.toJson())),
      };
}

class FoodSection {
  FoodSection({
    this.firstMeal,
    this.hotMeals,
    this.pizza,
  });

  FirstMeal firstMeal;
  HotMeals hotMeals;
  Pizza pizza;

  factory FoodSection.fromJson(Map<String, dynamic> json) => FoodSection(
        firstMeal: FirstMeal.fromJson(json['First Meal']),
        hotMeals: HotMeals.fromJson(json['Hot Meals']),
        pizza: Pizza.fromJson(json['Pizza']),
      );

  Map<String, dynamic> toJson() => {
        'First Meal': firstMeal.toJson(),
        'Hot Meals': hotMeals.toJson(),
        'Pizza': pizza.toJson(),
      };
}

class FirstMeal {
  FirstMeal({
    this.soupList,
  });

  List<FoodElement> soupList;

  factory FirstMeal.fromJson(Map<String, dynamic> json) => FirstMeal(
        soupList: List<FoodElement>.from(
            json['soupList'].map((x) => FoodElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'soupList': List<dynamic>.from(soupList.map((x) => x.toJson())),
      };
}

class HotMeals {
  HotMeals({
    this.steakList,
  });

  List<FoodElement> steakList;

  factory HotMeals.fromJson(Map<String, dynamic> json) => HotMeals(
        steakList: List<FoodElement>.from(
            json['steakList'].map((x) => FoodElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'steakList': List<dynamic>.from(steakList.map((x) => x.toJson())),
      };
}

class Pizza {
  Pizza({
    this.pizzaList,
  });

  List<FoodElement> pizzaList;

  factory Pizza.fromJson(Map<String, dynamic> json) => Pizza(
        pizzaList: List<FoodElement>.from(
            json['pizzaList'].map((x) => FoodElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'pizzaList': List<dynamic>.from(pizzaList.map((x) => x.toJson())),
      };
}

class HotDrinkSection {
  HotDrinkSection({
    this.dripCoffee,
    this.espresso,
    this.tea,
  });

  DripCoffee dripCoffee;
  Espresso espresso;
  Tea tea;

  factory HotDrinkSection.fromJson(Map<String, dynamic> json) =>
      HotDrinkSection(
        dripCoffee: DripCoffee.fromJson(json['Drip Coffee']),
        espresso: Espresso.fromJson(json['Espresso']),
        tea: Tea.fromJson(json['Tea']),
      );

  Map<String, dynamic> toJson() => {
        'Drip Coffee': dripCoffee.toJson(),
        'Espresso': espresso.toJson(),
        'Tea': tea.toJson(),
      };
}

class DripCoffee {
  DripCoffee({
    this.dripCoffeeList,
  });

  List<FoodElement> dripCoffeeList;

  factory DripCoffee.fromJson(Map<String, dynamic> json) => DripCoffee(
        dripCoffeeList: List<FoodElement>.from(
            json['dripCoffeeList'].map((x) => FoodElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'dripCoffeeList':
            List<dynamic>.from(dripCoffeeList.map((x) => x.toJson())),
      };
}

class Espresso {
  Espresso({
    this.espressoList,
  });

  List<FoodElement> espressoList;

  factory Espresso.fromJson(Map<String, dynamic> json) => Espresso(
        espressoList: List<FoodElement>.from(
            json['espressoList'].map((x) => FoodElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'espressoList': List<dynamic>.from(espressoList.map((x) => x.toJson())),
      };
}

class Tea {
  Tea({
    this.teaList,
  });

  List<FoodElement> teaList;

  factory Tea.fromJson(Map<String, dynamic> json) => Tea(
        teaList: List<FoodElement>.from(
            json['teaList'].map((x) => FoodElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'teaList': List<dynamic>.from(teaList.map((x) => x.toJson())),
      };
}

class WineSection {
  WineSection({
    this.red,
    this.sparkling,
    this.white,
  });

  Red red;
  Sparkling sparkling;
  White white;

  factory WineSection.fromJson(Map<String, dynamic> json) => WineSection(
        red: Red.fromJson(json['Red']),
        sparkling: Sparkling.fromJson(json['Sparkling']),
        white: White.fromJson(json['White']),
      );

  Map<String, dynamic> toJson() => {
        'Red': red.toJson(),
        'Sparkling': sparkling.toJson(),
        'White': white.toJson(),
      };
}

class Red {
  Red({
    this.redWineList,
  });

  List<FoodElement> redWineList;

  factory Red.fromJson(Map<String, dynamic> json) => Red(
        redWineList: List<FoodElement>.from(
            json['redWineList'].map((x) => FoodElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'redWineList': List<dynamic>.from(redWineList.map((x) => x.toJson())),
      };
}

class Sparkling {
  Sparkling({
    this.sparklingWineList,
  });

  List<FoodElement> sparklingWineList;

  factory Sparkling.fromJson(Map<String, dynamic> json) => Sparkling(
        sparklingWineList: List<FoodElement>.from(
            json['sparklingWineList'].map((x) => FoodElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'sparklingWineList':
            List<dynamic>.from(sparklingWineList.map((x) => x.toJson())),
      };
}

class White {
  White({
    this.whiteWineList,
  });

  List<FoodElement> whiteWineList;

  factory White.fromJson(Map<String, dynamic> json) => White(
        whiteWineList: List<FoodElement>.from(
            json['whiteWineList'].map((x) => FoodElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'whiteWineList':
            List<dynamic>.from(whiteWineList.map((x) => x.toJson())),
      };
}
