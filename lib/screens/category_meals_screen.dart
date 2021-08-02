import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadInitData = false;

  @override
  // void initState() {
  //   final routArgs =
  //       ModalRoute.of(context).settings.arguments as Map<String, String>;
  //   categoryTitle = routArgs['title'];
  //   final CategoryId = routArgs['id'];
  //   displayedMeals = DUMMY_MEALS.where(
  //     (meal) {
  //       return meal.categories.contains(CategoryId);
  //     },
  //   ).toList();
  //   super.initState();
  // }
  void didChangeDependencies() {
    if (!_loadInitData) {
      final routArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routArgs['title'];
      final CategoryId = routArgs['id'];
      displayedMeals = widget.availableMeals.where(
        (meal) {
          return meal.categories.contains(CategoryId);
        },
      ).toList();
      _loadInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                removeItem: _removeMeal,
                id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                imageUrl: displayedMeals[index].imageUrl,
                duration: displayedMeals[index].duration,
                complexity: displayedMeals[index].complexity,
                affordability: displayedMeals[index].affordability);
          },
          itemCount: displayedMeals.length,
        ));
  }
}
