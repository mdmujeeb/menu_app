import 'package:flutter/material.dart';

import './categories_page.dart';
import './favorites_page.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesPage(), 'title': 'Categories'},
    {'page': FavoritesPage(), 'title': 'Your Favorites'},
  ];

  int _selectedPageIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
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
