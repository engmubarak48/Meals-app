import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // const ({ Key? key }) : super(key: key);
  // final String CategoryId;
  // final String CategoryTitle;

  // CategoryMealsScreen(this.CategoryId, this.CategoryTitle);

  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final CategoryTitle = routArgs['title'];
    final CategoryId = routArgs['id'];
    final categoryMeals = DUMMY_MEALS.where(
      (meal) {
        return meal.categories.contains(CategoryId);
      },
    ).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(CategoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
