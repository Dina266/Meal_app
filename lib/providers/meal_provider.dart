import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../models/category.dart';
import '../models/meal.dart';

class MealProvider extends ChangeNotifier {

    Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  List<Category> availableCategory = DUMMY_CATEGORIES;

  void setFilters() async{

      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();

      List<Meal> fm = [];

      favoriteMeals.forEach((favMeals) {
          availableMeals.forEach((avMeals) { 
                if(favMeals.id == avMeals.id) fm.add(favMeals);

              });
          });

          favoriteMeals = fm;

      List<Category> ac = [];

      availableMeals.forEach((meal) {
          meal.categories.forEach((catId) {
              DUMMY_CATEGORIES.forEach((cat) { 
                if(cat.id == catId)
                {
                  if(!ac.any((cat) => cat.id == catId)) ac.add(cat);
                  }

              });
          });

      } ,);

      availableCategory = ac;



      notifyListeners();

      // SharedPreferences prefs = await SharedPreferences.getInstance();

      // prefs.setBool('gluten', filters['gluten']!);
      // prefs.setBool('lactose', filters['lactose']!);
      // prefs.setBool('vegan', filters['vegan']!);
      // prefs.setBool('vegetarian', filters['vegetarian']!);

  }

  void toggleFavorite(String mealId) {
    final existingIndex =
        favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
        favoriteMeals.removeAt(existingIndex);
    } else {
        favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );

    }
    notifyListeners();
  }


  bool isMealFavorite(String id) {
    return favoriteMeals.any((meal) => meal.id == id);
    
  }

}