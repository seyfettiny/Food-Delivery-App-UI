import 'package:food_delivery_app/models/food_model.dart';

class RestaurantModel {
  String title;
  String imgUrl;
  String description;
  List<String> restaurantType;
  var foodSection;
  var beerSection;
  var wineSection;
  var hotDrinkSection;
  bool isFav;
  RestaurantModel({
    this.title,
    this.imgUrl,
    this.description,
    this.restaurantType,
    this.foodSection,
    this.beerSection,
    this.wineSection,
    this.hotDrinkSection,
    this.isFav,
  });
}

List restaurantList = [
  RestaurantModel(
    title: 'Scandic Hotel Kødbyen Restaurant',
    imgUrl: 'assets/images/restaurant/1.jpg',
    description:
        'Are you looking for succulent steaks and aromatic wines? Welcome to MØR - a new, authentic food experience in Kødbyen. Watch steaks simmering on the grill in our  open kitchen and dine side by side with our expert chefs. Please note that we don\'t accept cash payment in MØR restaurant & bar.',
    restaurantType: ['Fine Dinner', 'Family', 'Contemporary'],
    foodSection: {
      'First Meal': soupList,
      'Hot Meals': steakList,
      'Pizza': pizzaList,
    },
    beerSection: {
      'Ale': aleBeerList,
      'Lager': lagerBeerList,
      'Wheat Beer': wheatBeerList,
    },
    wineSection: {
      'Red': redWineList,
      'White': whiteWineList,
      'Sparkling': sparklingWineList,
    },
    hotDrinkSection: {
      'Tea': teaList,
      'Drip Coffee': dripCoffeeList,
      'Espresso': espressoList,
    },
  ),
  RestaurantModel(
    title: 'Island Grill',
    imgUrl: 'assets/images/restaurant/2.jpg',
    description:
        'Are you looking for succulent steaks and aromatic wines? Welcome to MØR - a new, authentic food experience in Kødbyen. Watch steaks simmering on the grill in our  open kitchen and dine side by side with our expert chefs. Please note that we don\'t accept cash payment in MØR restaurant & bar.',
    restaurantType: ['Casual Dining', 'Fast Food', 'Buffet'],
    foodSection: {
      'First Meal': soupList,
      'Hot Meals': steakList,
      'Pizza': pizzaList,
    },
    beerSection: {
      'Ale': aleBeerList,
      'Lager': lagerBeerList,
      'Wheat Beer': wheatBeerList,
    },
    wineSection: {
      'Red': redWineList,
      'White': whiteWineList,
      'Sparkling': sparklingWineList,
    },
    hotDrinkSection: {
      'Tea': teaList,
      'Drip Coffee': dripCoffeeList,
      'Espresso': espressoList,
    },
  ),
  RestaurantModel(
    title: 'Green Curry',
    imgUrl: 'assets/images/restaurant/3.jpg',
    description:
        'Are you looking for succulent steaks and aromatic wines? Welcome to MØR - a new, authentic food experience in Kødbyen. Watch steaks simmering on the grill in our  open kitchen and dine side by side with our expert chefs. Please note that we don\'t accept cash payment in MØR restaurant & bar.',
    restaurantType: ['Fine Dinner', 'Family', 'Coffee House'],
    foodSection: {
      'First Meal': soupList,
      'Hot Meals': steakList,
      'Pizza': pizzaList,
    },
    beerSection: {
      'Ale': aleBeerList,
      'Lager': lagerBeerList,
      'Wheat Beer': wheatBeerList,
    },
    wineSection: {
      'Red': redWineList,
      'White': whiteWineList,
      'Sparkling': sparklingWineList,
    },
    hotDrinkSection: {
      'Tea': teaList,
      'Drip Coffee': dripCoffeeList,
      'Espresso': espressoList,
    },
  ),
  RestaurantModel(
    title: 'El Pirata Porch',
    imgUrl: 'assets/images/restaurant/4.jpg',
    description:
        'Are you looking for succulent steaks and aromatic wines? Welcome to MØR - a new, authentic food experience in Kødbyen. Watch steaks simmering on the grill in our  open kitchen and dine side by side with our expert chefs. Please note that we don\'t accept cash payment in MØR restaurant & bar.',
    restaurantType: ['Cafe', 'Fine Dinner', 'Fast Food'],
    foodSection: {
      'First Meal': soupList,
      'Hot Meals': steakList,
      'Pizza': pizzaList,
    },
    beerSection: {
      'Ale': aleBeerList,
      'Lager': lagerBeerList,
      'Wheat Beer': wheatBeerList,
    },
    wineSection: {
      'Red': redWineList,
      'White': whiteWineList,
      'Sparkling': sparklingWineList,
    },
    hotDrinkSection: {
      'Tea': teaList,
      'Drip Coffee': dripCoffeeList,
      'Espresso': espressoList,
    },
  ),
  RestaurantModel(
    title: 'Salty Squid',
    imgUrl: 'assets/images/restaurant/5.jpg',
    description:
        'Are you looking for succulent steaks and aromatic wines? Welcome to MØR - a new, authentic food experience in Kødbyen. Watch steaks simmering on the grill in our  open kitchen and dine side by side with our expert chefs. Please note that we don\'t accept cash payment in MØR restaurant & bar.',
    restaurantType: ['Fine Dinner', 'Family'],
    foodSection: {
      'First Meal': soupList,
      'Hot Meals': steakList,
      'Pizza': pizzaList,
    },
    beerSection: {
      'Ale': aleBeerList,
      'Lager': lagerBeerList,
      'Wheat Beer': wheatBeerList,
    },
    wineSection: {
      'Red': redWineList,
      'White': whiteWineList,
      'Sparkling': sparklingWineList,
    },
    hotDrinkSection: {
      'Tea': teaList,
      'Drip Coffee': dripCoffeeList,
      'Espresso': espressoList,
    },
  ),
  RestaurantModel(
    title: 'Pancake World',
    imgUrl: 'assets/images/restaurant/6.jpg',
    description:
        'Are you looking for succulent steaks and aromatic wines? Welcome to MØR - a new, authentic food experience in Kødbyen. Watch steaks simmering on the grill in our  open kitchen and dine side by side with our expert chefs. Please note that we don\'t accept cash payment in MØR restaurant & bar.',
    restaurantType: ['Fine Dinner', 'Family', 'Cafe'],
    foodSection: {
      'First Meal': soupList,
      'Hot Meals': steakList,
      'Pizza': pizzaList,
    },
    beerSection: {
      'Ale': aleBeerList,
      'Lager': lagerBeerList,
      'Wheat Beer': wheatBeerList,
    },
    wineSection: {
      'Red': redWineList,
      'White': whiteWineList,
      'Sparkling': sparklingWineList,
    },
    hotDrinkSection: {
      'Tea': teaList,
      'Drip Coffee': dripCoffeeList,
      'Espresso': espressoList,
    },
  ),
  RestaurantModel(
    title: 'Bangalore Spices',
    imgUrl: 'assets/images/restaurant/7.jpg',
    description:
        'Are you looking for succulent steaks and aromatic wines? Welcome to MØR - a new, authentic food experience in Kødbyen. Watch steaks simmering on the grill in our  open kitchen and dine side by side with our expert chefs. Please note that we don\'t accept cash payment in MØR restaurant & bar.',
    restaurantType: ['Fast Food', 'Family'],
    foodSection: {
      'First Meal': soupList,
      'Hot Meals': steakList,
      'Pizza': pizzaList,
    },
    beerSection: {
      'Ale': aleBeerList,
      'Lager': lagerBeerList,
      'Wheat Beer': wheatBeerList,
    },
    wineSection: {
      'Red': redWineList,
      'White': whiteWineList,
      'Sparkling': sparklingWineList,
    },
    hotDrinkSection: {
      'Tea': teaList,
      'Drip Coffee': dripCoffeeList,
      'Espresso': espressoList,
    },
  ),
  RestaurantModel(
    title: 'Dashing Hummingbird Ristorante',
    imgUrl: 'assets/images/restaurant/8.jpg',
    description:
        'Are you looking for succulent steaks and aromatic wines? Welcome to MØR - a new, authentic food experience in Kødbyen. Watch steaks simmering on the grill in our  open kitchen and dine side by side with our expert chefs. Please note that we don\'t accept cash payment in MØR restaurant & bar.',
    restaurantType: ['Fast Food', 'Family'],
    foodSection: {
      'First Meal': soupList,
      'Hot Meals': steakList,
      'Pizza': pizzaList,
    },
    beerSection: {
      'Ale': aleBeerList,
      'Lager': lagerBeerList,
      'Wheat Beer': wheatBeerList,
    },
    wineSection: {
      'Red': redWineList,
      'White': whiteWineList,
      'Sparkling': sparklingWineList,
    },
    hotDrinkSection: {
      'Tea': teaList,
      'Drip Coffee': dripCoffeeList,
      'Espresso': espressoList,
    },
  ),
  RestaurantModel(
    title: 'Northern Bee Bar and Grill',
    imgUrl: 'assets/images/restaurant/9.jpg',
    description:
        'Are you looking for succulent steaks and aromatic wines? Welcome to MØR - a new, authentic food experience in Kødbyen. Watch steaks simmering on the grill in our  open kitchen and dine side by side with our expert chefs. Please note that we don\'t accept cash payment in MØR restaurant & bar.',
    restaurantType: ['Fine Dinner', 'Family'],
    foodSection: {
      'First Meal': soupList,
      'Hot Meals': steakList,
      'Pizza': pizzaList,
    },
    beerSection: {
      'Ale': aleBeerList,
      'Lager': lagerBeerList,
      'Wheat Beer': wheatBeerList,
    },
    wineSection: {
      'Red': redWineList,
      'White': whiteWineList,
      'Sparkling': sparklingWineList,
    },
    hotDrinkSection: {
      'Tea': teaList,
      'Drip Coffee': dripCoffeeList,
      'Espresso': espressoList,
    },
  ),
  RestaurantModel(
    title: 'The Trumpeter Cucina',
    imgUrl: 'assets/images/restaurant/10.jpg',
    description:
        'Are you looking for succulent steaks and aromatic wines? Welcome to MØR - a new, authentic food experience in Kødbyen. Watch steaks simmering on the grill in our  open kitchen and dine side by side with our expert chefs. Please note that we don\'t accept cash payment in MØR restaurant & bar.',
    restaurantType: ['Fine Dinner', 'Family'],
    foodSection: {
      'First Meal': soupList,
      'Hot Meals': steakList,
      'Pizza': pizzaList,
    },
    beerSection: {
      'Ale': aleBeerList,
      'Lager': lagerBeerList,
      'Wheat Beer': wheatBeerList,
    },
    wineSection: {
      'Red': redWineList,
      'White': whiteWineList,
      'Sparkling': sparklingWineList,
    },
    hotDrinkSection: {
      'Tea': teaList,
      'Drip Coffee': dripCoffeeList,
      'Espresso': espressoList,
    },
  ),
  RestaurantModel(
    title: ' Wanderlust Supper Club',
    imgUrl: 'assets/images/restaurant/11.jpg',
    description:
        'Are you looking for succulent steaks and aromatic wines? Welcome to MØR - a new, authentic food experience in Kødbyen. Watch steaks simmering on the grill in our  open kitchen and dine side by side with our expert chefs. Please note that we don\'t accept cash payment in MØR restaurant & bar.',
    restaurantType: ['Fine Dinner', 'Family'],
    foodSection: {
      'First Meal': soupList,
      'Hot Meals': steakList,
      'Pizza': pizzaList,
    },
    beerSection: {
      'Ale': aleBeerList,
      'Lager': lagerBeerList,
      'Wheat Beer': wheatBeerList,
    },
    wineSection: {
      'Red': redWineList,
      'White': whiteWineList,
      'Sparkling': sparklingWineList,
    },
    hotDrinkSection: {
      'Tea': teaList,
      'Drip Coffee': dripCoffeeList,
      'Espresso': espressoList,
    },
  ),
  RestaurantModel(
    title: 'First Orchid Café',
    imgUrl: 'assets/images/restaurant/12.jpg',
    description:
        'Are you looking for succulent steaks and aromatic wines? Welcome to MØR - a new, authentic food experience in Kødbyen. Watch steaks simmering on the grill in our  open kitchen and dine side by side with our expert chefs. Please note that we don\'t accept cash payment in MØR restaurant & bar.',
    restaurantType: ['Fine Dinner', 'Cafe'],
    foodSection: {
      'First Meal': soupList,
      'Hot Meals': steakList,
      'Pizza': pizzaList,
    },
    beerSection: {
      'Ale': aleBeerList,
      'Lager': lagerBeerList,
      'Wheat Beer': wheatBeerList,
    },
    wineSection: {
      'Red': redWineList,
      'White': whiteWineList,
      'Sparkling': sparklingWineList,
    },
    hotDrinkSection: {
      'Tea': teaList,
      'Drip Coffee': dripCoffeeList,
      'Espresso': espressoList,
    },
  ),
  RestaurantModel(
    title: 'Gourmand Ristorante',
    imgUrl: 'assets/images/restaurant/13.jpg',
    description:
        'Are you looking for succulent steaks and aromatic wines? Welcome to MØR - a new, authentic food experience in Kødbyen. Watch steaks simmering on the grill in our  open kitchen and dine side by side with our expert chefs. Please note that we don\'t accept cash payment in MØR restaurant & bar.',
    restaurantType: ['Cafe', 'Family'],
    foodSection: {
      'First Meal': soupList,
      'Hot Meals': steakList,
      'Pizza': pizzaList,
    },
    beerSection: {
      'Ale': aleBeerList,
      'Lager': lagerBeerList,
      'Wheat Beer': wheatBeerList,
    },
    wineSection: {
      'Red': redWineList,
      'White': whiteWineList,
      'Sparkling': sparklingWineList,
    },
    hotDrinkSection: {
      'Tea': teaList,
      'Drip Coffee': dripCoffeeList,
      'Espresso': espressoList,
    },
  ),
  RestaurantModel(
    title: 'Swirling Chops Pubhouse',
    imgUrl: 'assets/images/restaurant/14.jpg',
    description:
        'Are you looking for succulent steaks and aromatic wines? Welcome to MØR - a new, authentic food experience in Kødbyen. Watch steaks simmering on the grill in our  open kitchen and dine side by side with our expert chefs. Please note that we don\'t accept cash payment in MØR restaurant & bar.',
    restaurantType: ['Fine Dinner', 'Family'],
    foodSection: {
      'First Meal': soupList,
      'Hot Meals': steakList,
      'Pizza': pizzaList,
    },
    beerSection: {
      'Ale': aleBeerList,
      'Lager': lagerBeerList,
      'Wheat Beer': wheatBeerList,
    },
    wineSection: {
      'Red': redWineList,
      'White': whiteWineList,
      'Sparkling': sparklingWineList,
    },
    hotDrinkSection: {
      'Tea': teaList,
      'Drip Coffee': dripCoffeeList,
      'Espresso': espressoList,
    },
  ),
];
