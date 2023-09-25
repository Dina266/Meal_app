import 'package:flutter/material.dart';
import 'package:meal/providers/meal_provider.dart';
import 'package:provider/provider.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  

  // FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    // bool landscape = MediaQuery.of(context).orientation == Orientation.landscape;
    var dw = MediaQuery.of(context).size.width;
    final List<Meal> favoriteMeals = Provider.of<MealProvider>(context , listen: true).favoriteMeals;
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: dw <= 400? 400 : 500,
        childAspectRatio: dw/(dw*0.887615),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
