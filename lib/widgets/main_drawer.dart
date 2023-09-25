import 'package:flutter/material.dart';
import 'package:meal/screens/theme_screen.dart';
import 'package:provider/provider.dart';

import '../providers/theme_providers.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({super.key});



  Widget buildListTile(String title, BuildContext ctx,IconData icon, Function() tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color:  Provider.of<ThemeProvider>(ctx).primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Provider.of<ThemeProvider>(context).hintColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Provider.of<ThemeProvider>(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals',context , Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters',context, Icons.settings, () {
          
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
          buildListTile('Your Themes', context,Icons.color_lens, () {
          
            Navigator.of(context).pushReplacementNamed(ThemeScreen.routeName);
          }),
        ],
      ),
    );
  }
}
