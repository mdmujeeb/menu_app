import 'package:flutter/material.dart';

import './models/meal.dart';
import './dummy_data.dart';

import './pages/meal_details_page.dart';
import './pages/categories_page.dart';
import './pages/category_meals_page.dart';
import './pages/tabs_page.dart';
import './pages/filters_page.dart';

void main() => runApp(DeliMealsApp());

class DeliMealsApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _DeliMealsAppState createState() => _DeliMealsAppState();
}

class _DeliMealsAppState extends State<DeliMealsApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilterData(Map<String, bool> filterData) {
    setState(() {
      _filters['gluten'] = filterData['gluten'];
      _filters['lactose'] = filterData['lactose'];
      _filters['vegetarian'] = filterData['vegetarian'];
      _filters['vegan'] = filterData['vegan'];

      _availableMeals = DUMMY_MEALS
          .where((meal) =>
              (!_filters['gluten'] || meal.isGlutenFree) &&
              (!_filters['lactose'] || meal.isLactoseFree) &&
              (!_filters['vegetarian'] || meal.isVegetarian) &&
              (!_filters['vegan'] || meal.isVegan))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meals',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.blue,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Audiowide',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontFamily: 'Audiowide',
              fontWeight: FontWeight.normal,
            )),
      ),
      routes: {
        '/': (ctx) => TabsPage(),
        CategoryMealsPage.ROUTE_NAME: (ctx) =>
            CategoryMealsPage(_availableMeals),
        MealDetailsPage.ROUTE_NAME: (ctx) => MealDetailsPage(),
        FiltersPage.ROUTE_NAME: (ctx) => FiltersPage(_filters, _setFilterData),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (context) => CategoriesPage());
      },
      onUnknownRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (context) => CategoriesPage());
      },
    );
  }
}
