import 'package:flutter/material.dart';

import './pages/meal_details_page.dart';
import './pages/categories_page.dart';
import './pages/category_meals_page.dart';
import './pages/tabs_page.dart';

void main() => runApp(DeliMealsApp());

class DeliMealsApp extends StatelessWidget {
  // This widget is the root of your application.
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
        CategoryMealsPage.ROUTE_NAME: (ctx) => CategoryMealsPage(),
        MealDetailsPage.ROUTE_NAME: (ctx) => MealDetailsPage(),
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
