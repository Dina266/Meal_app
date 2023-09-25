import 'package:flutter/material.dart';
import 'package:meal/providers/meal_provider.dart';
import 'package:meal/screens/theme_screen.dart';
import 'package:provider/provider.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/filters_screen.dart';
import './screens/categories_screen.dart';
import 'providers/theme_providers.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MealProvider>(create: (ctx) => MealProvider()),
        ChangeNotifierProvider<ThemeProvider>(create: (ctx) => ThemeProvider()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false,home: MyApp()),
    )

    );
}

class MyApp extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    var primaryColor =
        Provider.of<ThemeProvider>(context, listen: true).primaryColor;
    var hintColor =
        Provider.of<ThemeProvider>(context, listen: true).hintColor;
    var tm = Provider.of<ThemeProvider>(context, listen: true).tm;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      themeMode: tm,
      
      theme: ThemeData(
        primaryColor: Colors.pink,
        hintColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        splashColor: Colors.black87,
        cardColor: Colors.white,
        shadowColor: Colors.white60,
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyMedium: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            headlineSmall: TextStyle(
              color: Colors.black87,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),
            titleLarge: TextStyle(
              color: Colors.black87,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
        colorScheme: ColorScheme.fromSwatch( )
            .copyWith(secondary: hintColor ),
      ),
      darkTheme: ThemeData(
        primaryColor: primaryColor,
        hintColor: Colors.amber,
        canvasColor: Color.fromRGBO(14, 22, 33, 1),
        fontFamily: 'Raleway',
        splashColor: Colors.white70,
        cardColor: Color.fromRGBO(24, 37, 51, 1),
        shadowColor: Colors.black54,
        unselectedWidgetColor: Colors.white70,
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyMedium: TextStyle(
                color: Colors.white60,
              ),
              headlineSmall: TextStyle(
                color: Colors.white,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
              titleLarge: TextStyle(
                color: Colors.white,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: hintColor),),
      
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
        ThemeScreen.routeName: (ctx) => ThemeScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      // ignore: body_might_complete_normally_nullable
      onGenerateRoute: (settings) {
        // ignore: avoid_print
        print(settings.arguments);

      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}

