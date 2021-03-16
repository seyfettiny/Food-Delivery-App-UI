import 'package:food_delivery_app/models/food_model.dart';

class Cart {
  int id;
  Food food;
  int amount;
  Cart({
    this.id,
    this.food,
    this.amount,
  });
}

List cartItems = [
  Cart(
    id: 0,
    food: soupList[0],
    amount: 2,
  ),
  Cart(
    id: 0,
    food: pizzaList[0],
    amount: 1,
  ),
  Cart(
    id: 0,
    food: lagerBeerList[1],
    amount: 2,
  ),
];
