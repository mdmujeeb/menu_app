import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersPage extends StatelessWidget {
  static const String ROUTE_NAME = '/filters-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Text('Filters'),
    );
  }
}
