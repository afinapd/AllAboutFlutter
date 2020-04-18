enum Affordability {Afforable,Pricey,Luxurious}

class Meal {
  String id;
  List<String> categories;
  String title;
  String imageUrl;
  String bussinessHour;
  List<String> ingredients;
  Affordability affordability;

  bool isVegetarian;
  bool isSpicy;

  Meal({
    this.id,
    this.title,
    this.categories,
    this.ingredients,
    this.affordability,
    this.isSpicy,
    this.isVegetarian,
    this.bussinessHour,
    this.imageUrl,
});
}