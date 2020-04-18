import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  String id;
  String title;
  String imageUrl;

  Affordability afford;
  String businessHour;

  MealItem(this.id,this.title,this.imageUrl,this.afford,this.businessHour);

  String get affordabilityText{
    switch(afford){
      case Affordability.Afforable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxuriuous';
      default:
        return 'Unknown';
    }
  }

  void _selectMeal(BuildContext context){
    Navigator.of(context).pushNamed(MealDetailScreen.ROUTE_NAME,arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>_selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft:  Radius.circular(15),
                    topRight: Radius.circular(15)
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black54
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.monetization_on),
                        SizedBox(width: 6),
                        Text(affordabilityText),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.access_time),
                        SizedBox(width: 6),
                        Text(businessHour)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
