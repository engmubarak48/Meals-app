import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class filtersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentfilters;

  filtersScreen(this.currentfilters, this.saveFilters);

  @override
  _filtersScreenState createState() => _filtersScreenState();
}

class _filtersScreenState extends State<filtersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentfilters['gluten'];
    _vegetarian = widget.currentfilters['vegetarian'];
    _vegan = widget.currentfilters['vegan'];
    _lactoseFree = widget.currentfilters['lactose'];
    super.initState();
  }

  Widget _buildSswitchListTile(
    String title,
    String desctiption,
    bool currentValue,
    Function UpdateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        desctiption,
      ),
      onChanged: UpdateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters!'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };

              widget.saveFilters(selectedFilters);
            },
            icon: Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSswitchListTile(
                  'Gluten-free',
                  'Only include Gluten-free meals!',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSswitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals!',
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildSswitchListTile(
                  'Vegeterian',
                  'Only include Vegeterian meals!',
                  _vegetarian,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSswitchListTile(
                  'Vegan',
                  'Only include Vegan meals!',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
