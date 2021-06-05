import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:http/http.dart' as http;

import '../models/cart_model.dart';
import '../models/food_model.dart';
import '../models/restaurant_model.dart';
import '../models/user_model.dart';

class FirebaseBaseClass {
  final firebaseBaseUrl =
      'https://food-delivery-app-c1c8d-default-rtdb.europe-west1.firebasedatabase.app';

  Future<dynamic> fetchUsers() async {
    final response = await http.get(Uri.parse(firebaseBaseUrl + '/user.json'));
    if (response.statusCode == 200) {
      var users = List<User>.from(
          json.decode(response.body).map((x) => User.fromJson(x)));
      return users;
    } else {
      throw Exception('Failed to load Users');
    }
  }

  Future<dynamic> fetchCart() async {
    final response = await http.get(Uri.parse(firebaseBaseUrl + '/cart.json'));
    if (response.statusCode == 200) {
      var cart = cartFromJson(response.body);
      return cart;
    } else {
      throw Exception('Failed to load Cart');
    }
  }

  Future<dynamic> fetchFoods() async {
    final response = await http.get(Uri.parse(firebaseBaseUrl + '/food.json'));
    if (response.statusCode == 200) {
      var foods = foodFromJson(response.body);
      return foods;
    } else {
      throw Exception('Failed to load Foods');
    }
  }

  Future<dynamic> fetchRestaurants() async {
    final response =
        await http.get(Uri.parse(firebaseBaseUrl + '/restaurant.json'));
    if (response.statusCode == 200) {
      var restaurants = restaurantFromJson(response.body);
      return restaurants;
    } else {
      throw Exception('Failed to load Restaurants');
    }
  }

  Future<String> downloadUserImageURL(String name) async {
    var downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref('/assets/images/user/$name')
        .getDownloadURL();
    return downloadURL;
  }

  Future<String> downloadFoodImageURL(String name) async {
    var downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref('/assets/images/food/$name')
        .getDownloadURL();
    return downloadURL;
  }

  Future<String> downloadRestaurantImageURL(String name) async {
    var downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref('/assets/images/restaurant/$name')
        .getDownloadURL();
    return downloadURL;
  }
}
