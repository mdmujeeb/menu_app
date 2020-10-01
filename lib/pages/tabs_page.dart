import 'package:flutter/material.dart';

import '../models/meal.dart';

import './categories_page.dart';
import './favorites_page.dart';
import '../widgets/main_drawer.dart';

class TabsPage extends StatefulWidget {
  final List<Meal> _favoriteMeals;

  TabsPage(this._favoriteMeals);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _pages = [
      {'page': CategoriesPage(), 'title': 'Categories'},
      {'page': FavoritesPage(widget._favoriteMeals), 'title': 'Your Favorites'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectTab,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amber,
          currentIndex: _selectedPageIndex,
          // type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                // backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category),
                title: Text('Categories')),
            BottomNavigationBarItem(
                // backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.star),
                title: Text('Favorites')),
          ]),
    );
  }
}
