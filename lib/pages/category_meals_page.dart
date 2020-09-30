import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

import '../models/meal.dart';

class CategoryMealsPage extends StatefulWidget {
  static const ROUTE_NAME = '/category-meals';

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  Map<String, String> args;

  String _categoryId;
  String _categoryTitle;
  List<Meal> _categoryMeals;

  void _deleteMeal(id) {
    setState(() {
      _categoryMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  void didChangeDependencies() {
    args = ModalRoute.of(context).settings.arguments as Map<String, String>;
    _categoryId = args['id'];
    _categoryTitle = args['title'];
    _categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(_categoryId);
    }).toList();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _categoryMeals[index].id,
            title: _categoryMeals[index].title,
            imageUrl: _categoryMeals[index].imageUrl,
            duration: _categoryMeals[index].duration,
            complexity: _categoryMeals[index].complexity,
            affordability: _categoryMeals[index].affordability,
            removeItem: _deleteMeal,
          );
        },
        itemCount: _categoryMeals.length,
      ),
    );
  }
}
