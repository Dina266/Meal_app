import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:meal/providers/meal_provider.dart';
// import 'package:provider/provider.dart';
import '../providers/theme_providers.dart';
import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';


class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs';

  // TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    // Provider.of<MealProvider>(context , listen: false).setData();
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        backgroundColor: Provider.of<ThemeProvider>(context).primaryColor,
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Provider.of<ThemeProvider>(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Provider.of<ThemeProvider>(context).hintColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Provider.of<ThemeProvider>(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Provider.of<ThemeProvider>(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
