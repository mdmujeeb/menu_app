import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../dummy_data.dart';

class MealDetailsPage extends StatelessWidget {
  static const ROUTE_NAME = '/meal-details';

  final Function _isMealFavorite;
  final Function _toggleFavoriteMeal;

  MealDetailsPage(this._isMealFavorite, this._toggleFavoriteMeal);

  Widget _buildSectionTitle(BuildContext context, String text) {
    return Container(
        child: Text(
      text,
      style: Theme.of(context).textTheme.headline6,
    ));
  }

  Widget _buildList(
      BuildContext context, List<String> list, bool isIngredients) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) => Column(children: [
          ListTile(
            leading: CircleAvatar(
              child: Text('# ${index + 1}'),
            ),
            title: Text(list[index]),
          ),
          Divider(),
        ]),
        itemCount: list.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final Meal meal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                child: Image.network(
                  meal.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _buildSectionTitle(context, 'Ingredients'),
            _buildList(context, meal.ingredients, true),
            _buildSectionTitle(context, 'Steps'),
            _buildList(context, meal.steps, false),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _isMealFavorite(meal.id) ? Icons.favorite : Icons.favorite_border,
        ),
        onPressed: () => _toggleFavoriteMeal(meal.id),
      ),
    );
  }
}
