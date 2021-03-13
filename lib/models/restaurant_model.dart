import 'package:food_delivery_app/models/food_model.dart';

class RestaurantModel {
  String title;
  String imgUrl;
  String description;
  List<String> restaurantType;
  List<String> menuTitles;
  List<List<Food>> menu;
  bool isFav;
  RestaurantModel({
    this.title,
    this.imgUrl,
    this.description,
    this.restaurantType,
    this.menu,
    this.isFav,
  });
}

List restaurantList = [
  RestaurantModel(
    title: 'Scandic Hotel Kødbyen Vesterbro Restaurant',
    imgUrl: 'assets/images/restaurant/Ciqxn7FE4vE.jpg',
    description:
        'Are you looking for succulent steaks and aromatic wines? Welcome to MØR - a new, authentic food experience in Kødbyen. Watch steaks simmering on the grill in our  open kitchen and dine side by side with our expert chefs. Please note that we don\'t accept cash payment in MØR restaurant & bar.',
    restaurantType: ['Fine Dinner', 'Family'],
    menu: [
      soupList,
      steakList,
      pizzaList,
      pastaList,
      burgerList,
    ],
  )
];
