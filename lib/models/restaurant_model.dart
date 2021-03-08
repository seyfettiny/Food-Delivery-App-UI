import 'dart:convert';

import 'package:flutter/foundation.dart';

class RestaurantModel {
  final String title;
  final List<String> restaurantTypes;
  final List<String> meals;
  RestaurantModel({
    this.title,
    this.restaurantTypes,
    this.meals,
  });

  RestaurantModel copyWith({
    String title,
    List<String> restaurantTypes,
    List<String> meals,
  }) {
    return RestaurantModel(
      title: title ?? this.title,
      restaurantTypes: restaurantTypes ?? this.restaurantTypes,
      meals: meals ?? this.meals,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'restaurantTypes': restaurantTypes,
      'meals': meals,
    };
  }

  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RestaurantModel(
      title: map['title'],
      restaurantTypes: List<String>.from(map['restaurantTypes']),
      meals: List<String>.from(map['meals']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RestaurantModel.fromJson(String source) =>
      RestaurantModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'RestaurantModel(title: $title, restaurantTypes: $restaurantTypes, meals: $meals)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RestaurantModel &&
        o.title == title &&
        listEquals(o.restaurantTypes, restaurantTypes) &&
        listEquals(o.meals, meals);
  }

  @override
  int get hashCode =>
      title.hashCode ^ restaurantTypes.hashCode ^ meals.hashCode;
}
