import 'package:flutter/material.dart';

import '../models/meal.dart';

import '../widgets/meal_item.dart';

class FavoritesPage extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  FavoritesPage(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return Center(
        child: Text('No Favorites. Start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favoriteMeals[index].id,
            title: _favoriteMeals[index].title,
            imageUrl: _favoriteMeals[index].imageUrl,
            duration: _favoriteMeals[index].duration,
            complexity: _favoriteMeals[index].complexity,
            affordability: _favoriteMeals[index].affordability,
          );
        },
        itemCount: _favoriteMeals.length,
      );
    }
  }
}
