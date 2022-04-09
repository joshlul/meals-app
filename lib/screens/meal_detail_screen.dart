// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../category_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/categories/meal_detail';

  const MealDetailScreen({Key? key}) : super(key: key);

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(0, 0, 0, .10),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      height: 300,
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    AppBar appBar = AppBar(
      title: Text("Meal detail"),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Image.network(
                selectedMeal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              buildSectionTitle(context, "Ingredients"),
              buildContainer(
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      elevation: 3,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "#${index + 1}. ${selectedMeal.ingredients[index]}",
                        ),
                      ),
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            "${index + 1}",
                          ),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                          style: TextStyle(
                              color: Colors.black87,
                              fontFamily: "RobotoCondensed"),
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
