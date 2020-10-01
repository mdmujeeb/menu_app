import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static const String ROUTE_NAME = '/filters-page';

  final Map<String, bool> _filterData;
  final Function _onUpdateFilterData;

  FiltersPage(this._filterData, this._onUpdateFilterData);

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegetarian = false;
  var _isVegan = false;

  @override
  initState() {
    _isGlutenFree = widget._filterData['gluten'];
    _isLactoseFree = widget._filterData['lactose'];
    _isVegetarian = widget._filterData['vegetarian'];
    _isVegan = widget._filterData['vegan'];
    super.initState();
  }

  Widget _buildSwitchTileWidget(
      String title, String subtitle, bool value, Function onChange) {
    return SwitchListTile(
      value: value,
      onChanged: onChange,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget._filterData['gluten'] = _isGlutenFree;
              widget._filterData['lactose'] = _isLactoseFree;
              widget._filterData['vegetarian'] = _isVegetarian;
              widget._filterData['vegan'] = _isVegan;
              widget._onUpdateFilterData(widget._filterData);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Select Your filters',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTileWidget('Gluten Free',
                    'Only include Gluten free Meals.', _isGlutenFree, (value) {
                  setState(() {
                    _isGlutenFree = value;
                  });
                }),
                _buildSwitchTileWidget(
                    'Lactose Free',
                    'Only include Lactose free Meals.',
                    _isLactoseFree, (value) {
                  setState(() {
                    _isLactoseFree = value;
                  });
                }),
                _buildSwitchTileWidget('Vegetarian',
                    'Only include Vegetarian Meals.', _isVegetarian, (value) {
                  setState(() {
                    _isVegetarian = value;
                  });
                }),
                _buildSwitchTileWidget(
                    'Vegan', 'Only include Vegan Meals.', _isVegan, (value) {
                  setState(() {
                    _isVegan = value;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
