import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const ROUTE_NAME ='/category-meals';

  @override
  Widget build(BuildContext context) {
    final Map<String,String>routeArgs=
        ModalRoute.of(context).settings.arguments;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx,index){
        return MealItem(
            categoryMeals[index].id,
            categoryMeals[index].title,
            categoryMeals[index].imageUrl,
            categoryMeals[index].affordability,
            categoryMeals[index].bussinessHour
        );
      }, itemCount: categoryMeals.length,
      ),
    );
  }
}
