import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(this.title,this.color,this.id);

  void _selectCategory(BuildContext context){
    Navigator.of(context).pushNamed(CategoryMealsScreen.ROUTE_NAME,
        arguments: {'id':id,'title':title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
          padding: EdgeInsets.all(10),
          child: Text(title, style: Theme.of(context).textTheme.title),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(15)
          )
      )
    );
  }
}
