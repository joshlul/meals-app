import 'package:flutter/material.dart';

import '../category_data.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category_meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    final title = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              categoryMeals[index].id,
              categoryMeals[index].title,
              categoryMeals[index].imageUrl,
              categoryMeals[index].duration,
              categoryMeals[index].complexity,
              categoryMeals[index].affordability,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
