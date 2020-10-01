import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsPage extends StatefulWidget {
  static const ROUTE_NAME = '/category-meals';

  final List<Meal> _availableMeals;

  CategoryMealsPage(this._availableMeals);

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  Map<String, String> args;

  String _categoryId;
  String _categoryTitle;
  List<Meal> _categoryMeals;

  @override
  void didChangeDependencies() {
    args = ModalRoute.of(context).settings.arguments as Map<String, String>;
    _categoryId = args['id'];
    _categoryTitle = args['title'];
    _categoryMeals = widget._availableMeals.where((meal) {
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
          );
        },
        itemCount: _categoryMeals.length,
      ),
    );
  }
}
