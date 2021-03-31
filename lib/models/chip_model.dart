class ChipModel {
  String name;
  bool isSelected;
  ChipModel({
    this.name,
    this.isSelected,
  });
  static var diet = [
    ChipModel(
      name: 'Gluten free',
      isSelected: true,
    ),
    ChipModel(
      name: 'Lactose free',
      isSelected: false,
    ),
    ChipModel(
      name: 'Sugar free',
      isSelected: false,
    ),
    ChipModel(
      name: 'Vegan',
      isSelected: false,
    ),
    ChipModel(
      name: 'Vegetarian',
      isSelected: false,
    ),
    ChipModel(
      name: 'Pescaterian',
      isSelected: false,
    ),
  ];
  static var foodLove = [
    ChipModel(
      name: 'Meat',
      isSelected: true,
    ),
    ChipModel(
      name: 'Seafood',
      isSelected: false,
    ),
    ChipModel(
      name: 'Cheese',
      isSelected: false,
    ),
    ChipModel(
      name: 'Bread',
      isSelected: false,
    ),
    ChipModel(
      name: 'Fruit',
      isSelected: false,
    ),
    ChipModel(
      name: 'Fish',
      isSelected: false,
    ),
    ChipModel(
      name: 'Ice Cream',
      isSelected: false,
    ),
  ];
  static var foodHate = [
    ChipModel(
      name: 'Vegetables',
      isSelected: false,
    ),
    ChipModel(
      name: 'Greens',
      isSelected: false,
    ),
    ChipModel(
      name: 'Meat',
      isSelected: false,
    ),
    ChipModel(
      name: 'Seafood',
      isSelected: false,
    ),
    ChipModel(
      name: 'Poultry',
      isSelected: false,
    ),
    ChipModel(
      name: 'Dairy',
      isSelected: false,
    ),
  ];
  static var noFood = [
    ChipModel(
      name: 'Seafood',
      isSelected: false,
    ),
    ChipModel(
      name: 'Eggs',
      isSelected: false,
    ),
    ChipModel(
      name: 'Pork',
      isSelected: false,
    ),
    ChipModel(
      name: 'Beef',
      isSelected: false,
    ),
    ChipModel(
      name: 'Peanuts',
      isSelected: false,
    ),
    ChipModel(
      name: 'Fish',
      isSelected: false,
    ),
    ChipModel(
      name: 'Soy',
      isSelected: false,
    ),
    ChipModel(
      name: 'Wheat',
      isSelected: false,
    ),
    ChipModel(
      name: 'Milk',
      isSelected: false,
    ),
    ChipModel(
      name: 'Alcohol',
      isSelected: false,
    ),
  ];
  static var favCuisines = [
    ChipModel(
      name: 'Spanish',
      isSelected: true,
    ),
    ChipModel(
      name: 'Italian',
      isSelected: false,
    ),
    ChipModel(
      name: 'Japanese',
      isSelected: false,
    ),
    ChipModel(
      name: 'Korean',
      isSelected: false,
    ),
    ChipModel(
      name: 'American',
      isSelected: false,
    ),
    ChipModel(
      name: 'Turkish',
      isSelected: false,
    ),
  ];
}
