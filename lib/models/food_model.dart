// To parse this JSON data, do
//
//     final food = foodFromJson(jsonString);

import 'dart:convert';

Food foodFromJson(String str) => Food.fromJson(json.decode(str));

String foodToJson(Food data) => json.encode(data.toJson());

class Food {
  List<FoodElement> soupList;
  List<FoodElement> steakList;
  List<FoodElement> pizzaList;
  List<FoodElement> pastaList;
  List<FoodElement> burgerList;
  List<FoodElement> aleBeerList;
  List<FoodElement> lagerBeerList;
  List<FoodElement> wheatBeerList;
  List<FoodElement> redWineList;
  List<FoodElement> whiteWineList;
  List<FoodElement> sparklingWineList;
  List<FoodElement> teaList;
  List<FoodElement> dripCoffeeList;
  List<FoodElement> espressoList;
  Food({
    this.soupList,
    this.steakList,
    this.pizzaList,
    this.pastaList,
    this.burgerList,
    this.aleBeerList,
    this.lagerBeerList,
    this.wheatBeerList,
    this.redWineList,
    this.whiteWineList,
    this.sparklingWineList,
    this.teaList,
    this.dripCoffeeList,
    this.espressoList,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        soupList: List<FoodElement>.from(
            json['soupList'].map((x) => FoodElement.fromJson(x))),
        steakList: List<FoodElement>.from(
            json['steakList'].map((x) => FoodElement.fromJson(x))),
        pizzaList: List<FoodElement>.from(
            json['pizzaList'].map((x) => FoodElement.fromJson(x))),
        pastaList: List<FoodElement>.from(
            json['pastaList'].map((x) => FoodElement.fromJson(x))),
        burgerList: List<FoodElement>.from(
            json['burgerList'].map((x) => FoodElement.fromJson(x))),
        aleBeerList: List<FoodElement>.from(
            json['aleBeerList'].map((x) => FoodElement.fromJson(x))),
        lagerBeerList: List<FoodElement>.from(
            json['lagerBeerList'].map((x) => FoodElement.fromJson(x))),
        wheatBeerList: List<FoodElement>.from(
            json['wheatBeerList'].map((x) => FoodElement.fromJson(x))),
        redWineList: List<FoodElement>.from(
            json['redWineList'].map((x) => FoodElement.fromJson(x))),
        whiteWineList: List<FoodElement>.from(
            json['whiteWineList'].map((x) => FoodElement.fromJson(x))),
        sparklingWineList: List<FoodElement>.from(
            json['sparklingWineList'].map((x) => FoodElement.fromJson(x))),
        teaList: List<FoodElement>.from(
            json['teaList'].map((x) => FoodElement.fromJson(x))),
        dripCoffeeList: List<FoodElement>.from(
            json['dripCoffeeList'].map((x) => FoodElement.fromJson(x))),
        espressoList: List<FoodElement>.from(
            json['espressoList'].map((x) => FoodElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'soupList': List<dynamic>.from(soupList.map((x) => x.toJson())),
        'steakList': List<dynamic>.from(steakList.map((x) => x.toJson())),
        'pizzaList': List<dynamic>.from(pizzaList.map((x) => x.toJson())),
        'pastaList': List<FoodElement>.from(pastaList.map((x) => x.toJson())),
        'burgerList': List<FoodElement>.from(burgerList.map((x) => x.toJson())),
        'aleBeerList':
            List<FoodElement>.from(aleBeerList.map((x) => x.toJson())),
        'lagerBeerList':
            List<FoodElement>.from(lagerBeerList.map((x) => x.toJson())),
        'wheatBeerList':
            List<FoodElement>.from(wheatBeerList.map((x) => x.toJson())),
        'redWineList':
            List<FoodElement>.from(redWineList.map((x) => x.toJson())),
        'whiteWineList':
            List<FoodElement>.from(whiteWineList.map((x) => x.toJson())),
        'sparklingWineList':
            List<FoodElement>.from(sparklingWineList.map((x) => x.toJson())),
        'teaList': List<FoodElement>.from(teaList.map((x) => x.toJson())),
        'dripCoffeeList':
            List<FoodElement>.from(dripCoffeeList.map((x) => x.toJson())),
        'espressoList':
            List<FoodElement>.from(espressoList.map((x) => x.toJson())),
      };
}

class FoodElement {
  FoodElement({
    this.name,
    this.description,
    this.imgUrl,
    this.serveTime,
    this.price,
    this.calories,
    this.weight,
    this.isFav,
  });

  String name;
  String description;
  String imgUrl;
  String serveTime;
  int price;
  int calories;
  String weight;
  bool isFav;

  factory FoodElement.fromJson(Map<String, dynamic> json) => FoodElement(
        name: json['name'],
        description: json['description'],
        imgUrl: json['imgUrl'],
        serveTime: json['serveTime'],
        price: json['price'],
        calories: json['calories'],
        weight: json['weight'],
        isFav: json['isFav'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'imgUrl': imgUrl,
        'serveTime': serveTime,
        'price': price,
        'calories': calories,
        'weight': weight,
        'isFav': isFav,
      };
}
