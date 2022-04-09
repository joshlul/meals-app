// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(this.id, this.title, this.imageUrl, this.duration,
      this.complexity, this.affordability,
      {Key? key})
      : super(key: key);
  void showMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    );
  }

  String get getComplexity {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Challanging";
      case Complexity.Hard:
        return "Hard";
      default:
        return "Unknown";
    }
  }

  String get getAffordability {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Luxurious:
        return "Luxurious";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: Container(
                    width: 250,
                    // color: Colors.black38,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        color: Colors.black38),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: "RobotoCondensed",
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 5),
                      Text("$duration Min"),
                    ],
                  ),
                  // SizedBox(width: 25),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 5),
                      Text(getComplexity),
                    ],
                  ),
                  // SizedBox(width: 25),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 5),
                      Text(getAffordability),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
