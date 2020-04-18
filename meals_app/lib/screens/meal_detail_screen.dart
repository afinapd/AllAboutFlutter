import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const ROUTE_NAME = '/meal-detail';

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text('Ingredients',
      style: Theme.of(context).textTheme.title),
    );
  }

  @override
  Widget build(BuildContext context){
    final String mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal)=>meal.id==mealId);
    final _appBar = AppBar(
      title: Text(selectedMeal.title),
    );

    return Scaffold(
      appBar: _appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl,fit:BoxFit.cover),
            ),
            _buildSectionTitle(context,'Ingredients'),
            Container(
              decoration:BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height:MediaQuery.of(context).size.height-450,
              width:300,
              child: ListView.builder(itemBuilder: (ctx,index){
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }, itemCount: selectedMeal.ingredients.length,
              )
            )
          ],
        ),
      ),
    );
  }
}
