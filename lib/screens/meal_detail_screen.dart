import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dummy_data.dart';
import '../providers/meal_provider.dart';
import '../providers/theme_providers.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  // MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(Widget child , BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var dw = MediaQuery.of(context).size.width;
    var dh = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: isLandscape? dh*0.5 : dh*0.25,
      width: isLandscape? (dw *0.5 -30) : dw,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    var liView = ListView.builder(
      itemBuilder: (ctx, index) => Card(
        color: Provider.of<ThemeProvider>(context).hintColor,
        child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            child: Text(
              selectedMeal.ingredients[index],
              style : TextStyle(color: Colors.white)
            )),
      ),
      itemCount: selectedMeal.ingredients.length,
    );

    var livbulder = ListView.builder(
      itemBuilder: (ctx, index) => Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Provider.of<ThemeProvider>(context).primaryColor,
              child: Text('# ${(index + 1)}' ,),
            ),
            title: Text(
              selectedMeal.steps[index],
              style: TextStyle(color: Colors.black54),
            ),
          ),
          Divider()
        ],
      ),
      itemCount: selectedMeal.steps.length,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
        backgroundColor: Provider.of<ThemeProvider>(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Hero(
                tag: mealId,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if (isLandscape)
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      buildSectionTitle(context, 'Ingredients'),
                      buildContainer(liView ,context),
                    ],
                  ),
                  Column(
                    children: [
                      buildSectionTitle(context, 'Steps'),
                      buildContainer(livbulder ,context),
                    ],
                  )
                ],
              ),
            if (!isLandscape) buildSectionTitle(context, 'Ingredients'),
            if (!isLandscape) buildContainer(liView,context),
            if (!isLandscape) buildSectionTitle(context, 'Steps'),
            if (!isLandscape) buildContainer(livbulder,context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Provider.of<MealProvider>(context, listen: true)
                  .isMealFavorite(mealId)
              ? Icons.star
              : Icons.star_border,
        ),
        onPressed: () => Provider.of<MealProvider>(context, listen: false)
            .toggleFavorite(mealId),
      ),
    );
  }
}
