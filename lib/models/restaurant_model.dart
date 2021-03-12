import 'package:food_delivery_app/models/food_model.dart';

class RestaurantModel {
  String title;
  String description;
  List<String> restaurantTypes;
  List<Food> foodList;
  RestaurantModel({
    this.title,
    this.description,
    this.restaurantTypes,
    this.foodList,
  });
}
