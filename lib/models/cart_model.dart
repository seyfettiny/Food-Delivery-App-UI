// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

import 'package:food_delivery_app/models/food_model.dart';

List<Cart> cartFromJson(String str) =>
    List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String cartToJson(List<Cart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
  Cart({
    this.amount,
    this.food,
  });

  int amount;
  FoodElement food;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        amount: json['amount'],
        food: FoodElement.fromJson(json['food']),
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'food': food.toJson(),
      };
}
